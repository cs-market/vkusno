<?php

use Tygh\Registry;
use Tygh\Enum\IP5BannerTypes;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    fn_trusted_vars('banners', 'banner_data');

    if ($mode == 'update') {
        $banner_id = !empty($_REQUEST['banner_id']) ? $_REQUEST['banner_id'] : 0;

        if ($banner_id) {

            $banner_images = fn_get_ip5_banner_images($banner_id);
            $images_update = fn_check_ip5_banner_need_images_update();

            foreach ($banner_images as $type => $banner_image_id) {
                if ($banner_image_id && !empty($images_update[$type])) {
                    fn_delete_image_pairs($banner_image_id, 'ip5_banner');
                    db_query("DELETE FROM ?:ip5_banner_images WHERE banner_id = ?i AND type = ?s", $banner_id, $type);
                    $banner_image_id = 0;
                }

                if (!empty($images_update[$type])) {
                    if (!$banner_image_id) {
                        $banner_image_id = db_get_next_auto_increment_id('ip5_banner_images');
                    }

                    $pair_data = fn_attach_image_pairs($type, 'ip5_banner', $banner_image_id, CART_LANGUAGE);
                    if (!empty($pair_data)) {
                        $banner_image_id = db_query("INSERT INTO ?:ip5_banner_images (banner_id, type) VALUE(?i, ?s)", $banner_id, $type);
                    }
                }
            }
        }
    }
}

if ($mode == 'update') {

    if ($banner = Tygh::$app['view']->getTemplateVars('banner')) {

        // if ($banner['type'] == IP5BannerTypes::IP5_GRAPHIC) {
            Registry::set("navigation.tabs.ip5banner_" . IP5BannerTypes::IP5_GRAPHIC, [
                'title' => __("ip5_banner.type.graphic"),
                'js' => true,
                'hidden' => true,
            ]);
        // } elseif ($banner['type'] == IP5BannerTypes::IP5_VIDEO) {
            Registry::set("navigation.tabs.ip5banner_" . IP5BannerTypes::IP5_VIDEO, [
                'title' => __("ip5_banner.type.video"),
                'js' => true,
                'hidden' => true,
            ]);
        // }
    }

}

?>