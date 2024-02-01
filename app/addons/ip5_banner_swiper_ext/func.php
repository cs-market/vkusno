<?php

use Tygh\Registry;
use Tygh\Enum\IP5BannerTypes;

/**
 * Install addon
 */
function fn_ip5_banner_swiper_ext_install()
{

    foreach (db_get_array('SHOW COLUMNS FROM ?:banner_descriptions;') as $field) {
        $fields_list[$field['Field']] = true;
    }

    if (!isset($fields_list['ip5_video_settings'])) {
        db_query('ALTER TABLE `?:banner_descriptions` ADD `ip5_video_settings` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `banner`;');
    }

    if (!isset($fields_list['ip5_graphic_settings'])) {
        db_query('ALTER TABLE `?:banner_descriptions` ADD `ip5_graphic_settings` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `banner`;');
    }

    /*db_query("CREATE TABLE IF NOT EXISTS `?:ip5_banner_images` (
            `banner_image_id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
            `banner_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
            `type` VARCHAR(30) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
            PRIMARY KEY (`banner_image_id`)
        )
        COLLATE='utf8_general_ci'
        ) Engine=MyISAM DEFAULT CHARSET UTF8;");*/

}

/**
 * Get banner types
 *
 * @return array
 */
function fn_get_ip5_banner_types()
{
    return [
        'graphic_desktop_image_main',
        'graphic_desktop_image_bg',
        'graphic_tablet_image_main',
        'graphic_tablet_image_bg',
        'graphic_mobile_image_main',
        'graphic_mobile_image_bg',
        'video_desktop_image_main',
        'video_desktop_image_bg',
        'video_tablet_image_main',
        'video_tablet_image_bg',
        'video_mobile_image_main',
        'video_mobile_image_bg',
    ];
}

/**
 * Checks of request for need to update the banner image.
 *
 * @return array $images_update
 */
function fn_check_ip5_banner_need_images_update()
{
    
    $images_update = [];
    foreach (fn_get_ip5_banner_types() as $type) {
        $images_update[$type] = true;
        if (!empty($_REQUEST['file_' . $type . '_image_icon']) && is_array($_REQUEST['file_' . $type . '_image_icon'])) {
            $image_banner = reset($_REQUEST['file_' . $type . '_image_icon']);
            if ($image_banner == $type) {
                $images_update[$type] = false;
            }
        }
    }

    return $images_update;
}

/**
 * Get banner banner_image_id.
 *
 * @param int   $type type
 * @return array $banner_images
 */
function fn_get_ip5_banner_images($banner_id)
{
    $banner_images = [];
    foreach (fn_get_ip5_banner_types() as $type) {
        $banner_images[$type] = 0;
    }

    foreach (db_get_array('SELECT banner_image_id, type FROM ?:ip5_banner_images WHERE banner_id = ?i', $banner_id) as $row) {
        $banner_images = array_merge($banner_images, [
            $row['type'] => $row['banner_image_id'],
        ]);

    }
    return $banner_images;
}

/**
 * Hook 'get_banner_data'
 *
 * @param int   $banner_id Banner ID
 * @param str   $lang_code Language code
 * @param array $fields    Fields list
 * @param array $joins     Joins list
 * @param str   $condition Conditions query
 */
function fn_ip5_banner_swiper_ext_get_banner_data($banner_id, $lang_code, &$fields, $joins, $condition)
{
    $fields[] = '?:banner_descriptions.ip5_graphic_settings';
    $fields[] = '?:banner_descriptions.ip5_video_settings';
}

/**
 * Hook 'get_banners_post'
 *
 * @param array $banners    banners list
 * @param array $params     params
 */
function fn_ip5_banner_swiper_ext_get_banners_post(&$banners, $params)
{
    if (empty($banners)) {
        return;
    }

    $banner_ids = array_column($banners, 'banner_id');

    $banners_data = db_get_hash_array('SELECT banner_id, ip5_graphic_settings, ip5_video_settings FROM ?:banner_descriptions WHERE banner_id IN (?n) AND lang_code = ?s', 'banner_id', $banner_ids, CART_LANGUAGE);

    foreach ($banners as $key => $_banner) {
        if ($_banner['type'] == IP5BannerTypes::IP5_GRAPHIC || $_banner['type'] == IP5BannerTypes::IP5_VIDEO) {
    
            $ip5_graphic_settings = json_decode(isset($banners_data[$_banner['banner_id']]['ip5_graphic_settings']) ? $banners_data[$_banner['banner_id']]['ip5_graphic_settings'] : [], true);
            $ip5_video_settings = json_decode(isset($banners_data[$_banner['banner_id']]['ip5_graphic_settings']) ? $banners_data[$_banner['banner_id']]['ip5_video_settings'] : [], true);

            $banners[$key]['ip5_graphic_settings'] = [
                'enable_tablet' => isset($ip5_graphic_settings['enable_tablet']) ? $ip5_graphic_settings['enable_tablet'] : 'N',
                'enable_mobile' => isset($ip5_graphic_settings['enable_mobile']) ? $ip5_graphic_settings['enable_mobile'] : 'N',
                'desktop' => isset($ip5_graphic_settings['desktop']) ? $ip5_graphic_settings['desktop'] : [],
                'tablet' => isset($ip5_graphic_settings['tablet']) ? $ip5_graphic_settings['tablet'] : [],
                'mobile' => isset($ip5_graphic_settings['mobile']) ? $ip5_graphic_settings['mobile'] : [],
            ];
            $banners[$key]['ip5_video_settings'] = [
                'enable_tablet' => isset($ip5_video_settings['enable_tablet']) ? $ip5_video_settings['enable_tablet'] : 'N',
                'enable_mobile' => isset($ip5_video_settings['enable_mobile']) ? $ip5_video_settings['enable_mobile'] : 'N',
                'desktop' => isset($ip5_video_settings['desktop']) ? $ip5_video_settings['desktop'] : [],
                'tablet' => isset($ip5_video_settings['tablet']) ? $ip5_video_settings['tablet'] : [],
                'mobile' => isset($ip5_video_settings['mobile']) ? $ip5_video_settings['mobile'] : [],
            ];

            $banner_images = fn_get_ip5_banner_images($_banner['banner_id']);
            $banner_image_ids = array_diff(array_values($banner_images), [0]);
        
            $images = fn_get_image_pairs($banner_image_ids, 'ip5_banner', 'M', true, false, CART_LANGUAGE);
        
            foreach ($banner_images as $image_type => $banner_image_id) {
                if (!empty($images[$banner_image_id])) {
                    $banners[$key][$image_type] = reset($images[$banner_image_id]);
                }
            }
        }
    }

}

/**
 * Hook 'get_banner_data_post'
 *
     * @param int   $banner_id Banner ID
     * @param str   $lang_code Language code
     * @param array $banner    Banner data
 */
function fn_ip5_banner_swiper_ext_get_banner_data_post($banner_id, $lang_code, &$banner)
{
    $ip5_graphic_settings = json_decode($banner['ip5_graphic_settings'], true);
    $ip5_video_settings = json_decode($banner['ip5_video_settings'], true);
    $banner['ip5_graphic_settings'] = [
        'enable_tablet' => isset($ip5_graphic_settings['enable_tablet']) ? $ip5_graphic_settings['enable_tablet'] : 'N',
        'enable_mobile' => isset($ip5_graphic_settings['enable_mobile']) ? $ip5_graphic_settings['enable_mobile'] : 'N',
        'desktop' => isset($ip5_graphic_settings['desktop']) ? $ip5_graphic_settings['desktop'] : [],
        'tablet' => isset($ip5_graphic_settings['tablet']) ? $ip5_graphic_settings['tablet'] : [],
        'mobile' => isset($ip5_graphic_settings['mobile']) ? $ip5_graphic_settings['mobile'] : [],
    ];
    $banner['ip5_video_settings'] = [
        'enable_tablet' => isset($ip5_video_settings['enable_tablet']) ? $ip5_video_settings['enable_tablet'] : 'N',
        'enable_mobile' => isset($ip5_video_settings['enable_mobile']) ? $ip5_video_settings['enable_mobile'] : 'N',
        'desktop' => isset($ip5_video_settings['desktop']) ? $ip5_video_settings['desktop'] : [],
        'tablet' => isset($ip5_video_settings['tablet']) ? $ip5_video_settings['tablet'] : [],
        'mobile' => isset($ip5_video_settings['mobile']) ? $ip5_video_settings['mobile'] : [],
    ];

    $banner_images = fn_get_ip5_banner_images($banner_id);
    $banner_image_ids = array_diff(array_values($banner_images), [0]);

    $images = fn_get_image_pairs($banner_image_ids, 'ip5_banner', 'M', true, false, $lang_code);

    foreach ($banner_images as $image_type => $banner_image_id) {
        if (!empty($images[$banner_image_id])) {
            $banner[$image_type] = reset($images[$banner_image_id]);
        }
    }
}

?>