<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2015 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Wed, 02 Dec 2015 08:26:04 GMT
 */
define('NV_SYSTEM', true);

// Xac dinh thu muc goc cua site
define('NV_ROOTDIR', pathinfo(str_replace(DIRECTORY_SEPARATOR, '/', __file__), PATHINFO_DIRNAME));

require NV_ROOTDIR . '/includes/mainfile.php';
require NV_ROOTDIR . '/includes/core/user_functions.php';

// Duyệt tất cả các ngôn ngữ
$language_query = $db->query('SELECT lang FROM ' . $db_config['prefix'] . '_setup_language WHERE setup = 1');
while (list ($lang) = $language_query->fetch(3)) {
    $mquery = $db->query("SELECT title, module_data FROM " . $db_config['prefix'] . "_" . $lang . "_modules WHERE module_file = 'salary'");
    while (list ($mod, $mod_data) = $mquery->fetch(3)) {
        $sql = array();
        $data = array();
        $data['groups_admin'] = '1';
        $data['groups_use'] = '4';
        $data['workdays'] = 24; // tổng số ngày công trong tháng
        $data['insurrance'] = 10.5; // hệ số tính bảo hiểm
        $data['overtime'] = 150; // tỉ lệ lương làm thêm giờ

        foreach ($data as $config_name => $config_value) {
            $sql[] = "INSERT INTO " . NV_CONFIG_GLOBALTABLE . " (lang, module, config_name, config_value) VALUES ('" . $lang . "', " . $db->quote($mod) . ", " . $db->quote($config_name) . ", " . $db->quote($config_value) . ")";
        }

        foreach ($sql as $_sql) {
            try {
                $db->query($_sql);
            } catch (PDOException $e) {
                //
            }
        }
        $nv_Cache->delMod($mod);
    }
}
die('OK');