<?php

if (!defined('BOOTSTRAP')) {
	die('Access denied');
}

fn_register_hooks(
    'get_banners_post',
    'get_banner_data_post',
    'get_banner_data'
);