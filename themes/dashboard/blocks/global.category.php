<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES ., JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Jan 17, 2011 11:34:27 AM
 */
if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (defined('NV_IS_FILE_THEMES')) {

    // include config theme
    function nv_block_config_menu($module, $data_block, $lang_block)
    {
        global $nv_Cache;
        $array_template = array(
            1 => $lang_block['template_1'],
            2 => $lang_block['template_2'],
            3 => $lang_block['template_3']
        );

        $html = '';
        $html .= "<div class=\"form-group\">";
        $html .= "	<label class=\"control-label col-sm-6\">" . $lang_block['menu'] . ":</label>";
        $html .= "	<div class=\"col-sm-9\"><select name=\"menuid\" class=\"form-control\">\n";

        $sql = "SELECT * FROM " . NV_PREFIXLANG . "_menu ORDER BY id DESC";
        // Module menu của hệ thống không ảo hóa, do đó chỉ định cache trực tiếp vào module tránh lỗi khi gọi file từ giao diện
        $list = $nv_Cache->db($sql, 'id', 'menu');
        foreach ($list as $l) {
            $sel = ($data_block['menuid'] == $l['id']) ? ' selected' : '';
            $html .= "<option value=\"" . $l['id'] . "\" " . $sel . ">" . $l['title'] . "</option>\n";
        }

        $html .= "	</select></div>\n";
        $html .= "</div>";
        //         ------------------------------------
        $html .= "<div class=\"form-group\">";
        $html .= "	<label class=\"control-label col-sm-6\">" . $lang_block['template'] . ":</label>";
        $html .= "	<div class=\"col-sm-9\"><select name=\"config_template\" class=\"form-control\">\n";

        foreach ($array_template as $value => $index) {
            $sel = ($data_block['template'] == $value) ? ' selected' : '';
            $html .= "<option value=\"" . $value . "\" " . $sel . ">" . $index . "</option>\n";
        }

        $html .= "	</select></div>\n";
        $html .= "</div>";
        //         -----------------------------

        $html .= "<div class=\"form-group\">";
        $html .= "<label class=\"control-label col-sm-6\">";
        $html .= $lang_block['title_length'];
        $html .= ":</label>";
        $html .= "<div class=\"col-sm-18\">";
        $html .= "<input type=\"text\" class=\"form-control\" name=\"config_title_length\" value=\"" . $data_block['title_length'] . "\"/>";
        $html .= "</div>";
        $html .= "</div>";

        return $html;
    }

    /**
     * nv_block_config_menu_submit()
     *
     * @param mixed $module
     * @param mixed $lang_block
     * @return
     */
    function nv_block_config_menu_submit($module, $lang_block)
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config'] = array();
        $return['config']['menuid'] = $nv_Request->get_int('menuid', 'post', 0);
        $return['config']['title_length'] = $nv_Request->get_int('config_title_length', 'post', 24);
        $return['config']['template'] = $nv_Request->get_int('config_template', 'post');
        return $return;
    }
}

if (!nv_function_exists('nv_menu_category')) {

    /**
     * nv_menu_category_check_current()
     *
     * @param mixed $url
     * @param integer $type
     * @return
     *
     */
    function nv_menu_category_check_current($url, $type = 0)
    {
        global $home, $client_info, $global_config;

        $module_name = 'menu';

        // Chinh xac tuyet doi
        if ($client_info['selfurl'] == $url) {
            return true;
        }

        if ($home and ($url == nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA) or $url == NV_BASE_SITEURL . 'index.php' or $url == NV_BASE_SITEURL)) {
            return true;
        } elseif ($url != NV_BASE_SITEURL) {
            $_curr_url = NV_BASE_SITEURL . str_replace($global_config['site_url'] . '/', '', $client_info['selfurl']);
            if ($type == 2) {
                if (preg_match('#' . preg_quote($url, '#') . '#', $_curr_url)) {
                    return true;
                }
            } elseif ($type == 1) {
                if (preg_match('#^' . preg_quote($url, '#') . '#', $_curr_url)) {
                    return true;
                }
            } elseif ($_curr_url == $url) {
                return true;
            }
        }
        return false;
    }

    /**
     * nv_menu_category()
     *
     * @param mixed $block_config
     * @return
     *
     */
    function nv_menu_category($block_config)
    {
        global $nv_Cache, $db_config, $global_config, $site_mods, $module_info, $module_name, $module_file, $module_data, $lang_global, $catid, $home;
        $block_config['module'] = 'menu';

        if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/blocks/global.category_' . $block_config['template'] . '.tpl')) {
            $block_theme = $global_config['module_theme'];
        } elseif (file_exists(NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/blocks/global.category_' . $block_config['template'] . '.tpl')) {
            $block_theme = $global_config['site_theme'];
        } else {
            $block_theme = 'default';
        }

        $array_menu = array();
        $sql = 'SELECT id, parentid, title, link, icon, image, note, subitem, groups_view, module_name, op, target, css, active_type, lev FROM ' . NV_PREFIXLANG . '_menu_rows WHERE status=1 AND mid = ' . $block_config['menuid'] . ' ORDER BY weight ASC';
        $list = $nv_Cache->db($sql, '', $block_config['module']);
        foreach ($list as $row) {
            if (nv_user_in_groups($row['groups_view'])) {
                switch ($row['target']) {
                    case 1:
                        $row['target'] = '';
                        break;
                    case 3:
                        $row['target'] = ' onclick="window.open(this.href,\'targetWindow\',\'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,\');return false;"';
                        break;
                    default:
                        $row['target'] = ' onclick="this.target=\'_blank\'"';
                }

                $array_menu[$row['parentid']][$row['id']] = array(
                    'id' => $row['id'],
                    'title' => $row['title'],
                    'title_trim' => nv_clean60($row['title'], $block_config['title_length']),
                    'target' => $row['target'],
                    'note' => empty($row['note']) ? $row['title'] : $row['note'],
                    'link' => nv_url_rewrite(nv_unhtmlspecialchars($row['link']), true),
                    'icon' => (empty($row['icon'])) ? '' : NV_BASE_SITEURL . NV_UPLOADS_DIR . '/menu/' . $row['icon'],
                    'image' => (empty($row['image'])) ? '' : NV_BASE_SITEURL . NV_UPLOADS_DIR . '/menu/' . $row['image'],
                    'css' => $row['css'],
                    'active_type' => $row['active_type'],
                    'lev' => $row['lev']
                );
            }
        }

        $xtpl = new XTemplate('global.category_' . $block_config['template'] . '.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('LANG', $lang_global);
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);
        $xtpl->assign('BLOCK_THEME', $block_theme);
        $xtpl->assign('THEME_SITE_HREF', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA);
        $xtpl->assign('BLOCK_TITLE', $block_config['title']);

        if (!empty($array_menu)) {
            foreach ($array_menu[0] as $id => $item) {
                $classcurrent = array();
                $submenu_active = array();
                if (isset($array_menu[$id])) {
                    $classcurrent[] = 'dropdown';
                    $submenu = nv_get_category_submenu($id, $array_menu, $submenu_active, $block_theme, $item['css'], $block_config);

                    $xtpl->assign('SUB', $submenu);

                    if (empty($item['css'])) {
                        $item['css'] = 'template_0';
                    }

                    if (!empty($item['image'])) {
                        $xtpl->assign('IMAGE', $item['image']);
                        $xtpl->parse('main.top_menu.sub.' . $item['css'] . '_image');
                    }

                    $xtpl->parse('main.top_menu.sub');
                    $xtpl->parse('main.top_menu.iconsub');
                    $xtpl->parse('main.top_menu.has_sub');
                }
                if (nv_menu_category_check_current($item['link'], $item['active_type'])) {
                    $classcurrent[] = 'active';
                } elseif (!empty($submenu_active)) {
                    $classcurrent[] = 'active';
                }
                if (!empty($item['class'])) {
                    $classcurrent[] = $item['class'];
                }
                $item['current'] = empty($classcurrent) ? '' : ' class="' . (implode(' ', $classcurrent)) . '"';

                if (nv_menu_category_check_current($item['link'], $item['active_type'])) {
                    $classcurrent[] = 'active';
                }
                    $xtpl->assign('TOP_MENU', $item);
                if (!empty($item['icon'])) {
                    $xtpl->parse('main.top_menu.icon');
                }
                $xtpl->parse('main.top_menu');
            }
        }

        $xtpl->parse('main');
        return $xtpl->text('main');
    }

    /**
     * @param int $id
     * @param array $array_menu
     * @param bool $submenu_active
     * @param string $block_theme
     * @param string $template
     * @return string
     */
    function nv_get_category_submenu($id, $array_menu, $submenu_active, $block_theme, $template, $block_config)
    {
        //         var_dump($block_config['template']);die;
        $xtpl = new XTemplate('global.category_' . $block_config['template'] . '.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');

        if (!empty($array_menu[$id])) {
            foreach ($array_menu[$id] as $sid => $smenu) {
                if (nv_menu_category_check_current($smenu['link'], $smenu['active_type'])) {
                    $submenu_active[] = $id;
                }
                $submenu = '';
                if (isset($array_menu[$sid])) {
                    $submenu = nv_get_category_submenu($sid, $array_menu, $submenu_active, $block_theme, $template, $block_config);
                    $xtpl->assign('SUB', $submenu);
                    $xtpl->parse('submenu.loop.item');
                }
                $xtpl->assign('SUBMENU', $smenu);
                if (!empty($submenu)) {
                    $xtpl->parse('submenu.loop.submenu');
                }
//                 var_dump($smenu);die;
//                 if (!empty($smenu['title'])) {
//                     $xtpl->assign('SUBTITLE',$smenu);
//                 }
                if (!empty($smenu['icon'])) {
                    $xtpl->parse('submenu.loop.icon');
                }

                if ($smenu['lev'] == 1) {
                    $xtpl->parse('submenu.loop.col');
                    $xtpl->parse('submenu.loop.strong');
                } elseif ($smenu['lev'] == 2) {
                    $xtpl->parse('submenu.loop.normal');
                }

                $xtpl->parse('submenu.loop');

                if ($smenu['lev'] == 1) {
                    $xtpl->parse('submenu.list');
                }
            }
            $xtpl->parse('submenu');
        }
        return $xtpl->text('submenu');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_menu_category($block_config);
}
