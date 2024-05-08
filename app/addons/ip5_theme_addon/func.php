<?php

use Tygh\Enum\SiteArea;

defined('BOOTSTRAP') or die('Access denied');

function fn_ip5_theme_addon_get_orders_post($params, &$orders) {
    if (!empty($orders) && SiteArea::isStorefront(AREA) || defined('API')) {
        //fn_print_die($orders);
        $order_ids = array_column($orders, 'order_id');

        $ordered_products = db_get_hash_multi_array(
            "SELECT ?:order_details.*, ?:product_descriptions.product, ?:products.status as product_status FROM ?:order_details "
            . "LEFT JOIN ?:product_descriptions ON ?:order_details.product_id = ?:product_descriptions.product_id AND ?:product_descriptions.lang_code = ?s "
            . "LEFT JOIN ?:products ON ?:order_details.product_id = ?:products.product_id "
            . "WHERE ?:order_details.order_id IN (?a) ORDER BY ?:product_descriptions.product",
             array('order_id','item_id'), DESCR_SL, $order_ids
        );

        foreach ($orders as &$order_info) {
            $order_info['products'] = $ordered_products[$order_info['order_id']];
            foreach ($order_info['products'] as $k => $item) {
                $order_info['products'][$k]['main_pair'] = fn_get_cart_product_icon($item['product_id'], $order_info['products'][$k]);
            }
        }
        unset($order_info);
    }
}

function fn_get_current_dispatch(){
    return $_REQUEST['dispatch'];
}
