<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC <contact@vinades.vn>
 * @Copyright (C) 2018 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Fri, 12 Jan 2018 09:47:27 GMT
 */
if (!defined('NV_IS_MOD_PROJECT')) die('Stop!!!');

if ($nv_Request->isset_request('delete_id', 'get') and $nv_Request->isset_request('delete_checkss', 'get')) {
    $id = $nv_Request->get_int('delete_id', 'get');
    $delete_checkss = $nv_Request->get_string('delete_checkss', 'get');
    if ($id > 0 and $delete_checkss == md5($id . NV_CACHE_PREFIX . $client_info['session_id'])) {
        nv_projects_delete($id);
        $nv_Cache->delMod($module_name);
        Header('Location: ' . NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op);
        die();
    }
} elseif ($nv_Request->isset_request('delete_list', 'post')) {
    $listall = $nv_Request->get_title('listall', 'post', '');
    $array_id = explode(',', $listall);

    if (!empty($array_id)) {
        foreach ($array_id as $id) {
            nv_projects_delete($id);
        }
        $nv_Cache->delMod($module_name);
        die('OK');
    }
    die('NO');
}

$is_download = false;

// nếu chưa autoload thì include thư viện
if (!class_exists('PHPExcel')) {
    if (file_exists(NV_ROOTDIR . '/includes/class/PHPExcel.php')) {
        include_once NV_ROOTDIR . '/includes/class/PHPExcel.php';
    }
}

if ($nv_Request->isset_request('download', 'post,get') and class_exists('PHPExcel')) {
    $is_download = true;
}

$where = '';
$base_url = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $op;
$per_page = 10;
$page = $nv_Request->get_int('page', 'post,get', 1);
$array_search = array(
    'q' => $nv_Request->get_title('q', 'post,get'),
    'workforceid' => $nv_Request->get_title('workforceid', 'get', 0),
    'customerid' => $nv_Request->get_int('customerid', 'get', 0),
    'daterange' => $nv_Request->get_string('daterange', 'get', ''),
    'realtime' => $nv_Request->get_string('realtime', 'get', ''),
    'status' => $nv_Request->get_int('status', 'post,get', 0)
);

if (!empty($array_search['q'])) {
    $base_url .= '&q=' . $array_search['q'];
    $where .= ' AND (title LIKE "%' . $array_search['q'] . '%"
        OR url_code LIKE "%' . $array_search['q'] . '%"
        OR content LIKE "%' . $array_search['q'] . '%")';
}
if (!empty($array_search['customerid'])) {
    $base_url .= '&amp;customerid=' . $array_search['customerid'];
    $where .= ' AND customerid=' . $array_search['customerid'];
}

if (!empty($array_search['workforceid'])) {
    $base_url .= '&amp;workforceid= ' . $array_search['workforceid'];
    $where .= ' AND workforceid = ' . $array_search['workforceid'];
}

if ($array_search['status'] > 0) {
    $base_url .= '&amp;status= ' . $array_search['status'];
    $where .= ' AND status = ' . $array_search['status'];
} elseif (!empty($array_config['default_status'])) {
    $where .= ' AND status IN (' . $array_config['default_status'] . ')';
}

if (!empty($array_search['daterange'])) {

    $begin_time = substr($array_search['daterange'], 0, 10);
    $end_time = substr($array_search['daterange'], -10);

    if (preg_match('/^([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{4})$/', $begin_time, $m)) {

        $begin_time = mktime(23, 59, 59, $m[2], $m[1], $m[3]);
    } else {
        $begin_time = 0;
    }
    if (preg_match('/^([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{4})$/', $end_time, $m)) {

        $end_time = mktime(23, 59, 59, $m[2], $m[1], $m[3]);
    } else {
        $end_time = 0;
    }

    $base_url .= '&amp;daterange= ' . $array_search['daterange'];
    $where .= ' AND begintime >= ' . $begin_time . ' AND endtime <= ' . $end_time;
}

if (!empty($array_search['realtime'])) {

    if (preg_match('/^([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{4})$/', $array_search['realtime'], $m)) {

        $_hour = 23;
        $_min = 23;
        $realtime = mktime($_hour, $_min, 59, $m[2], $m[1], $m[3]);
    } else {
        $realtime = 0;
    }
    $base_url .= '&amp;realtime= ' . $array_search['realtime'];
    $where .= ' AND realtime = ' . $realtime;
}
if (!empty($array_search['customerid'])) {
    $customer_info = nv_crm_customer_info($array_search['customerid']);
}

$where .= nv_projects_premission($module_name);

$db->sqlreset()
    ->select('COUNT(*)')
    ->from(NV_PREFIXLANG . '_' . $module_data . ' t1')
    ->join('INNER JOIN ' . NV_PREFIXLANG . '_' . $module_data . '_performer t2 ON t1.id=t2.projectid')
    ->where('1=1' . $where);
$sth = $db->prepare($db->sql());
$sth->execute();
$num_items = $sth->fetchColumn();

$db->select('*')
    ->order('id DESC')
    ->limit($per_page)
    ->offset(($page - 1) * $per_page);
$sth = $db->prepare($db->sql());
$sth->execute();

$customer_info = array();
if (!empty($array_search['customerid'])) {
    $customer_info = nv_crm_customer_info($array_search['customerid']);
}

while ($view = $sth->fetch()) {

    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_info WHERE rows_id=' . $view['id'];

    $result = $db->query($sql);
    $custom_fields = $result->fetch();

    foreach ($array_field_config as $field_info) {
        if ($field_info['field_choices'] && $field_info['sql_choices']) {
            $field_info['field_choices'] = [];
            $query = 'SELECT ' . $field_info['sql_choices'][2] . ', ' . $field_info['sql_choices'][3] . ' FROM ' . $field_info['sql_choices'][1];
            if (!empty($field_info['sql_choices'][4]) and !empty($field_info['sql_choices'][5])) {
                $query .= ' ORDER BY ' . $field_info['sql_choices'][4] . ' ' . $field_info['sql_choices'][5];
            }
            $result = $db->query($query);
            while (list ($key, $val) = $result->fetch(3)) {
                $field_info['field_choices'][$key] = $val;
            }
            $view['custom_field'][] = array(
                'title' => $field_info['title'],
                'value' => $field_info['field_choices'][$custom_fields[$field_info['field']]]
            );
        } else {
            $view['custom_field'][] = array(
                'title' => $field_info['title'],
                'value' => $custom_fields[$field_info['field']]
            );
        }
    }

    $view['price'] = number_format($view['price']);
    $view['begintime'] = (empty($view['begintime'])) ? '-' : nv_date('d/m/Y', $view['begintime']);
    $view['endtime'] = (empty($view['endtime'])) ? '-' : nv_date('d/m/Y', $view['endtime']);
    $view['realtime'] = (empty($view['realtime'])) ? '-' : nv_date('d/m/Y', $view['realtime']);
    $view['status'] = $lang_module['status_select_' . $view['status']];

    $view['performer_str'] = array();
    $performer = !empty($view['workforceid']) ? explode(',', $view['workforceid']) : array();
    foreach ($performer as $userid) {
        $view['performer_str'][] = isset($workforce_list[$userid]) ? $workforce_list[$userid]['fullname'] : '-';
    }
    $view['performer_str'] = !empty($view['performer_str']) ? implode(', ', $view['performer_str']) : '';

    if (!isset($array_users[$view['customerid']])) {
        $users = nv_crm_customer_info($view['customerid']);
        if ($users) {
            $view['customer'] = array(
                'fullname' => $users['fullname'],
                'link' => $users['link_view']
            );
            $array_users[$view['customerid']] = $view['customer'];
        } else {
            $view['customer'] = '';
        }
    } else {
        $view['customer'] = $array_users[$view['customerid']];
    }

    $array_data[$view['id']] = $view;
    $array_data_down[] = $view;
}

if ($is_download) {
    nv_exams_report_download($lang_module['manager_projects'], $array_data_down);
    die();
}

$xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('LANG_GLOBAL', $lang_global);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('OP', $op);
$xtpl->assign('ROW', $row);
$xtpl->assign('SEARCH', $array_search);
$xtpl->assign('ADD_URL', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=content');

$generate_page = nv_generate_page($base_url, $num_items, $per_page, $page);
if (!empty($generate_page)) {
    $xtpl->assign('NV_GENERATE_PAGE', $generate_page);
    $xtpl->parse('main.generate_page');
}
$number = $page > 1 ? ($per_page * ($page - 1)) + 1 : 1;
$array_users = array();
if (!empty($array_data)) {
    foreach ($array_data as $view) {
        $view['link_edit'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=content&amp;id=' . $view['id'];
        $view['link_delete'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $op . '&amp;delete_id=' . $view['id'] . '&amp;delete_checkss=' . md5($view['id'] . NV_CACHE_PREFIX . $client_info['session_id']);
        $view['link_view'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=detail&amp;id=' . $view['id'];
        $view['number'] = $number++;
        $xtpl->assign('VIEW', $view);

        if (!empty($view['files'])) {
            $xtpl->parse('main.loop.files');
        }

        $xtpl->parse('main.loop');
    }
}

if (!empty($workforce_list)) {
    foreach ($workforce_list as $user) {
        $user['selected'] = $user['userid'] == $array_search['workforceid'] ? 'selected="selected"' : '';
        $xtpl->assign('USER', $user);
        $xtpl->parse('main.user');
    }
}

$array_action = array(
    'delete_list_id' => $lang_global['delete']
);
foreach ($array_action as $key => $value) {
    $xtpl->assign('ACTION', array(
        'key' => $key,
        'value' => $value
    ));
    $xtpl->parse('main.action_top');
    $xtpl->parse('main.action_bottom');
}

foreach ($array_status as $index => $value) {
    $selected = $index == $array_search['status'] ? ' selected = "selected" ' : '';
    $xtpl->assign('STATUS', array(
        'index' => $index,
        'value' => $value,
        'selected' => $selected
    ));
    $xtpl->parse('main.status');
}
if (!empty($customer_info)) {
    $xtpl->assign('CUSTOMER', $customer_info);
    $xtpl->parse('main.customerid');
}

if (class_exists('PHPExcel') and !empty($array_data)) {
    $xtpl->assign('DOWNLOAD_URL', $base_url . '&download');
} else {
    $xtpl->parse('main.btn_disabled');
}

$xtpl->parse('main');
$contents = $xtpl->text('main');

$page_title = $module_info['custom_title'];

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';