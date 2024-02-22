<?php

defined('BOOTSTRAP') or die('Access denied');

if ($mode == 'view') {
    $subcategories = Tygh::$app['view']->getTemplateVars('subcategories');
    $products = Tygh::$app['view']->getTemplateVars('products');
    $products_categories = array_unique(array_column($products, 'main_category'));
    if (count($products_categories) > 1) {
        $separated_products = fn_group_array_by_key($products, 'main_category');
        Tygh::$app['view']->assign('separated_products', $separated_products);
    }
}
