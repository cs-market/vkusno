<?php
/*****************************************************************************
*                                                                            *
*                   All rights reserved! eCom Labs LLC                       *
* http://www.ecom-labs.com/about-us/ecom-labs-modules-license-agreement.html *
*                                                                            *
*****************************************************************************/

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_ecl_instock_sorting_db_query(&$query)
{
    if (AREA == 'C') {
        if (strpos($query, '1 as instock_marker') !== false && strpos($query, 'instock_sorting') !== false) {
            //$query = str_replace('ORDER BY', 'ORDER BY instock_sorting DESC,', $query);
            $q_find = "ORDER BY";
            $q_replace = "ORDER BY instock_sorting DESC,";
            if (strrpos($query, $q_find) !== false) {
                $query = substr_replace($query, $q_replace, strrpos($query, $q_find), strlen($q_find));
            }
        }
    }
}

function fn_ecl_instock_sorting_get_products($params, &$fields, &$sortings, $condition, $join, $sorting, $group_by, $lang_code, $having)
{
    if (AREA == 'C') {
        $fields['instock_marker'] = '1 as instock_marker';

        $inventory_condition = 'products.amount > 0,';
        if (version_compare(PRODUCT_VERSION, '4.12.1', '<')) {
            $inventory_condition = 'IF(
                        products.tracking = ?s, 
                        (SELECT MAX(amount) FROM ?:product_options_inventory s_inventory WHERE s_inventory.product_id = products.product_id) > 0, 
                        products.amount > 0
                    ),';
        }

        if (Registry::get('addons.product_variations.status') == 'A') {
            $fields['instock_sorting'] = db_quote("
            IF(
                products.product_type = ?s,
                (SELECT MAX(amount) FROM ?:products WHERE parent_product_id = products.product_id) > 0, 
                IF(
                    {$inventory_condition}
                 1, 
                 IF(
                    products.tracking = ?s, 
                    1, 
                    0
                 )
                )
            ) as instock_sorting", 'C', 'O', 'D');
        } else {
            $fields['instock_sorting'] = db_quote("
                IF(
                    {$inventory_condition}
                 1, 
                 IF(
                    products.tracking = ?s, 
                    1, 
                    0
                 )
            ) as instock_sorting", 'O', 'D');
        }
    }
}

function fn_ecl_instock_sorting_products_sorting(&$sorting, $simple_mode)
{
    $sorting['amount'] = array('description' => __('amount'), 'default_order' => 'desc');
}