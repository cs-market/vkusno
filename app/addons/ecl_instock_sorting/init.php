<?php
/*****************************************************************************
*                                                                            *
*                   All rights reserved! eCom Labs LLC                       *
* http://www.ecom-labs.com/about-us/ecom-labs-modules-license-agreement.html *
*                                                                            *
*****************************************************************************/

if (!defined('BOOTSTRAP')) { die('Access denied'); }

fn_register_hooks(
    'db_query',
    'get_products',
    'products_sorting'
);