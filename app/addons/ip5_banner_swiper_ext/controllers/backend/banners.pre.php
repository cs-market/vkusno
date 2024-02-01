<?php

use Tygh\Registry;
use Tygh\Enum\IP5BannerTypes;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    fn_trusted_vars('banners', 'banner_data');

    if ($mode == 'update') {
        
        if (isset($_POST['banner_data']['ip5_graphic_settings'])) {
            $_POST['banner_data']['ip5_graphic_settings'] = json_encode($_POST['banner_data']['ip5_graphic_settings'], JSON_UNESCAPED_UNICODE);
        }
        
        
        if (isset($_REQUEST['banner_data']['ip5_video_settings'])) {
            $_POST['banner_data']['ip5_video_settings'] = json_encode($_POST['banner_data']['ip5_video_settings'], JSON_UNESCAPED_UNICODE);
        }
 
    }
}

?>