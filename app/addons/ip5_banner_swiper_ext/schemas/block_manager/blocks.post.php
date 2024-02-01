<?php

$schema['banners']['templates']['addons/ip5_banner_swiper_ext/blocks/ip5_carousel_banner_ext.tpl'] = [
    'settings' => [

        'min_height' => [
            'option_name' => 'ip5_banner.options.min_height',
            'tooltip' => __('ttc_ip5_banner.options.min_height'),
            'type' => 'input',
            'default_value' => '400px'
        ],

        'navigation' => [
            'type' => 'selectbox',
            'values' => [
                'N' => 'none',
                'D' => 'dots',
                'P' => 'pages',
                'A' => 'arrows'
            ],
            'default_value' => 'D'
        ],

        'arrows' => [
            'option_name' => 'ip5_banner.options.arrows',
            'type' => 'checkbox',
            'default_value' => 'N'
        ],

        'loop' => [
            'option_name' => 'ip5_banner.options.loop',
            'type' => 'checkbox',
            'default_value' => 'N'
        ],

        'autoplay' => [
            'option_name' => 'ip5_banner.options.autoplay',
            'type' => 'checkbox',
            'default_value' => 'N'
        ],
        
        'pauseOnHover' => [
            'option_name' => 'ip5_banner.options.pauseOnHover',
            'tooltip' => __('ttc_ip5_banner.options.pauseOnHover'),
            'type' => 'checkbox',
            'default_value' => 'N'
        ],

        'autoplaySpeed' => [
            'option_name' => 'ip5_banner.options.autoplaySpeed',
            'tooltip' => __('ttc_ip5_banner.options.autoplaySpeed'),
            'type' => 'input',
            'default_value' => '3000'
        ],

        'speed' => [
            'option_name' => 'ip5_banner.options.speed',
            'type' => 'input',
            'default_value' => '600'
        ],

        'fade' => [
            'option_name' => 'ip5_banner.options.fade',
            'type' => 'checkbox',
            'default_value' => 'N'
        ],

        'lazyLoad' => [
            'option_name' => 'ip5_banner.options.lazyLoad',
            'type' => 'selectbox',
            'values' => [
                'P' => 'ip5_banner.options.progressive',
                'O' => 'ip5_banner.options.ondemand',
            ],
            'default_value' => 'O'
        ],

    ],
];

return $schema;