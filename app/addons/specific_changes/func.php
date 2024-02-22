<?php

use Tygh\Registry;
use Tygh\Enum\YesNo;

defined('BOOTSTRAP') or die('Access denied');

function fn_specific_changes_order_cancellation_extra_check(&$allow_cancel, $order) {
    if ($ttl = Registry::get('addons.specific_changes.order_cancel_ttl')) {
        if ($order['timestamp'] + $ttl * 60 < TIME) {
            $allow_cancel = YesNo::NO;
        }
    }
}
