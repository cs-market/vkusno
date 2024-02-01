
{********************** Mobile banner *********************}

{capture name="mob_slider"}
{strip}
{foreach from=$items item='b' key='key'}
 {$graphic_setts = $b.ip5_graphic_settings}{$graphic.tablet_on = $graphic_setts.enable_tablet}{$graphic.mobile_on = $graphic_setts.enable_mobile}{$graphic.desktop = $graphic_setts.desktop}{$graphic.tablet = $graphic_setts.tablet}{$graphic.mobile = $graphic_setts.mobile}{$img_graphic.desktop = $b.graphic_desktop_image_main}{$bg_graphic.desktop = $b.graphic_desktop_image_bg}{$img_graphic.tablet = $b.graphic_tablet_image_main}{$bg_graphic.tablet = $b.graphic_tablet_image_bg}{$img_graphic.mobile = $b.graphic_mobile_image_main}{$bg_graphic.mobile = $b.graphic_mobile_image_bg}{$video_setts = $b.ip5_video_settings}{$video.tablet_on = $video_setts.enable_tablet}{$video.mobile_on = $video_setts.enable_mobile}{$video.desktop = $video_setts.desktop}{$video.tablet = $video_setts.tablet}{$video.mobile = $video_setts.mobile}{$img_video.desktop = $b.video_desktop_image_main}{$bg_video.desktop = $b.video_desktop_image_bg}{$img_video.tablet = $b.video_tablet_image_main}{$bg_video.tablet = $b.video_tablet_image_bg}{$img_video.mobile = $b.video_mobile_image_main}{$bg_video.mobile = $b.video_mobile_image_bg}
 
<div id="banner_d_{$b.banner_id}" class="mob swiper-slide {if $b.type == "C"}image {$graphic.mobile.custom_class} {else}{if $video.mobile.background_video_type == 'html5'}video_html5 {/if} {$video.mobile.custom_class}{/if}" style="{if $block.properties.min_height !=""}height:{$block.properties.min_height};{/if}">

{if $b.type == "C"}

    {* включена мобилка *}
    {if $graphic.mobile_on == "YesNo::YES"|enum}
        {if !empty($graphic.mobile.motivation_link) && empty($graphic.mobile.motivation_text)}<a href="{$graphic.mobile.motivation_link|fn_url}"{if $graphic.mobile.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        <figure class="container-fluid-row">
            
            <div class="bg {$graphic.mobile.image_scaling}" style="background-color:{if $graphic.mobile.image_bg_color_use == "YesNo::YES"|enum}{$graphic.mobile.image_bg_color}{elseif $graphic.tablet.image_bg_color_use == "YesNo::YES"|enum}{$graphic.tablet.image_bg_color}{else}{$graphic.desktop.image_bg_color}{/if};">
                <picture>
                    {if $graphic.mobile_on == "YesNo::YES"|enum && $bg_graphic.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$bg_graphic.mobile.icon.image_path}" srcset="{$bg_graphic.mobile.icon.image_path}">{/if}
                    {if $graphic.tablet_on == "YesNo::YES"|enum && $bg_graphic.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$bg_graphic.tablet.icon.image_path}" srcset="{$bg_graphic.tablet.icon.image_path}">{/if}
                    {if $block.properties.lazyLoad == "O"}
                        <img class="image-entity banner__bg swiper-lazy" data-src="{$bg_graphic.desktop.icon.image_path}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAQAAAAD+Fb1AAAADklEQVR42mNkgAJG3AwAAH4ABWjFc8IAAAAASUVORK5CYII=" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                        <div class="swiper-lazy-preloader"></div>
                    {else}
                        <img class="image-entity banner__bg" srcset="{$bg_graphic.desktop.icon.image_path}" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                    {/if}
                </picture>
            </div>
            
            <figcaption class="ext_banner {$graphic.mobile.image_position} {$graphic.mobile.color_scheme}">
                <div class="ext_banner__content {$graphic.mobile.content_valign} {$graphic.mobile.content_align}" style="padding:{$graphic.mobile.padding|default:"0px"};">
                    {if $graphic.mobile.title_text !=""}<{$graphic.mobile.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$graphic.mobile.title_font_size|default:"40px"}; font-weight:{$graphic.mobile.title_font_weight};{if $graphic.mobile.title_font_color_use == "YesNo::YES"|enum}color:{$graphic.mobile.title_font_color};{/if}">{$graphic.mobile.title_text nofilter}</{$graphic.mobile.title_tag|default:div}>{/if}
                {if $graphic.mobile.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$graphic.mobile.description_font_size|default:"18px"};{if $graphic.mobile.description_font_color_use == "YesNo::YES"|enum} color:{$graphic.mobile.description_font_color};{/if}">
                    <p>{$graphic.mobile.description_text nofilter}</p>
                    </div>{/if}
                {if !empty($graphic.mobile.motivation_link) && !empty($graphic.mobile.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$graphic.mobile.motivation_font_size|default:"20px"};{if $graphic.mobile.motivation_font_color_use == "YesNo::YES"|enum}color:{$graphic.mobile.motivation_font_color};{/if}{if $graphic.mobile.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$graphic.mobile.motivation_button_color};{/if}" href="{$graphic.mobile.motivation_link|fn_url}" {if $graphic.mobile.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$graphic.mobile.motivation_text|strip_tags}">{$graphic.mobile.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image">
                    <picture>
                        {if $graphic.mobile_on == "YesNo::YES"|enum && $img_graphic.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$img_graphic.mobile.icon.image_path}" srcset="{$img_graphic.mobile.icon.image_path}">{/if}
                        {if $graphic.tablet_on == "YesNo::YES"|enum && $img_graphic.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$img_graphic.tablet.icon.image_path}" srcset="{$img_graphic.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_graphic.desktop.image_id}" data-src="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_graphic.desktop.image_id}" srcset="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
        </figure>
        {if !empty($graphic.mobile.motivation_link) && empty($graphic.mobile.motivation_text)}</a>{/if}

    
    {* выключена мобилка > включен планшет *}
    {elseif $graphic.mobile_on == 'N' && $graphic.tablet_on == "YesNo::YES"|enum}
        {if !empty($graphic.tablet.motivation_link) && empty($graphic.tablet.motivation_text)}<a href="{$graphic.tablet.motivation_link|fn_url}"{if $graphic.tablet.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        <figure class="container-fluid-row">
            
                <div class="bg {$graphic.tablet.image_scaling}" style="background-color:{if $graphic.tablet.image_bg_color_use == "YesNo::YES"|enum}{$graphic.tablet.image_bg_color}{else}{$graphic.desktop.image_bg_color}{/if};">
                    <picture>
                        {if $graphic.mobile_on == "YesNo::YES"|enum && $bg_graphic.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$bg_graphic.mobile.icon.image_path}" srcset="{$bg_graphic.mobile.icon.image_path}">{/if}
                        {if $graphic.tablet_on == "YesNo::YES"|enum && $bg_graphic.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$bg_graphic.tablet.icon.image_path}" srcset="{$bg_graphic.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="image-entity banner__bg swiper-lazy" data-src="{$bg_graphic.desktop.icon.image_path}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAQAAAAD+Fb1AAAADklEQVR42mNkgAJG3AwAAH4ABWjFc8IAAAAASUVORK5CYII=" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="image-entity banner__bg" srcset="{$bg_graphic.desktop.icon.image_path}" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            
            <figcaption class="ext_banner {$graphic.tablet.image_position} {$graphic.tablet.color_scheme}">
                <div class="ext_banner__content {$graphic.tablet.content_valign} {$graphic.tablet.content_align}" style="padding:{$graphic.tablet.padding|default:"0px"};">
                    {if $graphic.tablet.title_text !=""}<{$graphic.tablet.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$graphic.tablet.title_font_size|default:"40px"}; font-weight:{$graphic.tablet.title_font_weight};{if $graphic.tablet.title_font_color_use == "YesNo::YES"|enum}color:{$graphic.tablet.title_font_color};{/if}">{$graphic.tablet.title_text nofilter}</{$graphic.tablet.title_tag|default:div}>{/if}
                {if $graphic.tablet.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$graphic.tablet.description_font_size|default:"18px"};{if $graphic.tablet.description_font_color_use == "YesNo::YES"|enum} color:{$graphic.tablet.description_font_color};{/if}">
                    <p>{$graphic.tablet.description_text nofilter}</p>
                    </div>{/if}
                {if !empty($graphic.tablet.motivation_link) && !empty($graphic.tablet.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$graphic.tablet.motivation_font_size|default:"20px"};{if $graphic.tablet.motivation_font_color_use == "YesNo::YES"|enum}color:{$graphic.tablet.motivation_font_color};{/if}{if $graphic.tablet.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$graphic.tablet.motivation_button_color};{/if}" href="{$graphic.tablet.motivation_link|fn_url}" {if $graphic.tablet.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$graphic.tablet.motivation_text|strip_tags}">{$graphic.tablet.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image">
                    <picture>
                        {if $graphic.mobile_on == "YesNo::YES"|enum && $img_graphic.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$img_graphic.mobile.icon.image_path}" srcset="{$img_graphic.mobile.icon.image_path}">{/if}
                        {if $graphic.tablet_on == "YesNo::YES"|enum && $img_graphic.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$img_graphic.tablet.icon.image_path}" srcset="{$img_graphic.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_graphic.desktop.image_id}" data-src="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_graphic.desktop.image_id}" srcset="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
        </figure>
        {if !empty($graphic.tablet.motivation_link) && empty($graphic.tablet.motivation_text)}</a>{/if}


    {* выключена мобилка и выключен планшет > отображаем версию десктоп *}
    {else}
        {if !empty($graphic.desktop.motivation_link) && empty($graphic.desktop.motivation_text)}<a href="{$graphic.desktop.motivation_link|fn_url}"{if $graphic.desktop.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        <figure class="container-fluid-row">
            
            <div class="bg {$graphic.desktop.image_scaling}"{if $graphic.desktop.image_bg_color_use == "YesNo::YES"|enum} style="background-color:{$graphic.desktop.image_bg_color};"{/if}>
                <picture>
                    {if $graphic.mobile_on == "YesNo::YES"|enum && $bg_graphic.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$bg_graphic.mobile.icon.image_path}" srcset="{$bg_graphic.mobile.icon.image_path}">{/if}
                    {if $graphic.tablet_on == "YesNo::YES"|enum && $bg_graphic.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$bg_graphic.tablet.icon.image_path}" srcset="{$bg_graphic.tablet.icon.image_path}">{/if}
                    {if $block.properties.lazyLoad == "O"}
                        <img class="image-entity banner__bg swiper-lazy" data-src="{$bg_graphic.desktop.icon.image_path}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAQAAAAD+Fb1AAAADklEQVR42mNkgAJG3AwAAH4ABWjFc8IAAAAASUVORK5CYII=" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                        <div class="swiper-lazy-preloader"></div>
                    {else}
                        <img class="image-entity banner__bg" srcset="{$bg_graphic.desktop.icon.image_path}" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                    {/if}
                </picture>
            </div>
            
            <figcaption class="ext_banner {$graphic.desktop.image_position} {$graphic.desktop.color_scheme}">
                <div class="ext_banner__content {$graphic.desktop.content_valign} {$graphic.desktop.content_align}" style="padding:{$graphic.desktop.padding|default:"0px"};">
                    {if $graphic.desktop.title_text !=""}<{$graphic.desktop.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$graphic.desktop.title_font_size|default:"40px"}; font-weight:{$graphic.desktop.title_font_weight};{if $graphic.desktop.title_font_color_use == "YesNo::YES"|enum}color:{$graphic.desktop.title_font_color};{/if}">{$graphic.desktop.title_text nofilter}</{$graphic.desktop.title_tag|default:div}>{/if}
                {if $graphic.desktop.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$graphic.desktop.description_font_size|default:"18px"};{if $graphic.desktop.description_font_color_use == "YesNo::YES"|enum} color:{$graphic.desktop.description_font_color};{/if}">
                    <p>{$graphic.desktop.description_text nofilter}</p>
                    </div>{/if}
                {if !empty($graphic.desktop.motivation_link) && !empty($graphic.desktop.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$graphic.desktop.motivation_font_size|default:"20px"};{if $graphic.desktop.motivation_font_color_use == "YesNo::YES"|enum}color:{$graphic.desktop.motivation_font_color};{/if}{if $graphic.desktop.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$graphic.desktop.motivation_button_color};{/if}" href="{$graphic.desktop.motivation_link|fn_url}" {if $graphic.desktop.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$graphic.desktop.motivation_text|strip_tags}">{$graphic.desktop.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image">
                    <picture>
                        {if $graphic.mobile_on == "YesNo::YES"|enum && $img_graphic.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$img_graphic.mobile.icon.image_path}" srcset="{$img_graphic.mobile.icon.image_path}">{/if}
                        {if $graphic.tablet_on == "YesNo::YES"|enum && $img_graphic.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$img_graphic.tablet.icon.image_path}" srcset="{$img_graphic.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_graphic.desktop.image_id}" data-src="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_graphic.desktop.image_id}" srcset="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
        </figure>
        {if !empty($graphic.desktop.motivation_link) && empty($graphic.desktop.motivation_text)}</a>{/if}
    {/if}





{* выбрали шаблон фоновое видео $b.type == "V" *}
{else}


    {* включена видео мобилка *}
    {if $video.mobile_on == "YesNo::YES"|enum}
        {if !empty($video.mobile.motivation_link) && empty($video.mobile.motivation_text)}<a href="{$video.mobile.motivation_link|fn_url}"{if $video.mobile.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        <figure class="container-fluid-row">

            {* тип шаблона video *}
            <div class="bg {$video.mobile.image_scaling}" style="background-color:{if $video.mobile.image_bg_color_use == "YesNo::YES"|enum}{$video.mobile.image_bg_color}{elseif $video.tablet.image_bg_color_use == "YesNo::YES"|enum}{$video.tablet.image_bg_color}{else}{$video.desktop.image_bg_color}{/if};">
                <video muted autoplay loop playsinline class="image-entity banner__bg swiper-lazy" data-src="{if !empty($video.mobile.background_video_webm) || !empty($video.tablet.background_video_webm) || !empty($video.desktop.background_video_webm)}{if !empty($video.mobile.background_video_webm)}{$video.mobile.background_video_webm}{elseif !empty($video.tablet.background_video_webm)}{$video.tablet.background_video_webm}{else}{$video.desktop.background_video_webm}{/if}{/if}{if !empty($video.mobile.background_video_mp4) || !empty($video.tablet.background_video_mp4) || !empty($video.desktop.background_video_mp4)}{if !empty($video.mobile.background_video_mp4)}{$video.mobile.background_video_mp4}{elseif !empty($video.tablet.background_video_mp4)}{$video.tablet.background_video_mp4}{else}{$video.desktop.background_video_mp4}{/if}{/if}" poster="{if !empty($bg_video.mobile.icon.image_path)}{$bg_video.mobile.icon.image_path}{elseif !empty($bg_video.tablet.icon.image_path)}{$bg_video.tablet.icon.image_path}{else}{$bg_video.desktop.icon.image_path}{/if}"></video>
                <div class="swiper-lazy-preloader"></div>
            </div>
            {* / тип шаблона video *}
            
            <figcaption class="ext_banner {$video.mobile.image_position} {$video.mobile.color_scheme}">
                <div class="ext_banner__content {$video.mobile.content_valign} {$video.mobile.content_align}" style="padding:{$video.mobile.padding|default:"0px"};">
                    {if $video.mobile.title_text !=""}<{$video.mobile.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$video.mobile.title_font_size|default:"40px"}; font-weight:{$video.mobile.title_font_weight};{if $video.mobile.title_font_color_use == "YesNo::YES"|enum}color:{$video.mobile.title_font_color};{/if}">{$video.mobile.title_text nofilter}</{$video.mobile.title_tag|default:div}>{/if}
                {if $video.mobile.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$video.mobile.description_font_size|default:"18px"};{if $video.mobile.description_font_color_use == "YesNo::YES"|enum} color:{$video.mobile.description_font_color};{/if}">
                    <p>{$video.mobile.description_text nofilter}</p>
                    </div>{/if}
                {if !empty($video.mobile.motivation_link) && !empty($video.mobile.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$video.mobile.motivation_font_size|default:"20px"};{if $video.mobile.motivation_font_color_use == "YesNo::YES"|enum}color:{$video.mobile.motivation_font_color};{/if}{if $video.mobile.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$video.mobile.motivation_button_color};{/if}" href="{$video.mobile.motivation_link|fn_url}" {if $video.mobile.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$video.mobile.motivation_text|strip_tags}">{$video.mobile.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image">
                    <picture>
                        {if $video.mobile_on == "YesNo::YES"|enum && $img_video.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$img_video.mobile.icon.image_path}" srcset="{$img_video.mobile.icon.image_path}">{/if}
                        {if $video.tablet_on == "YesNo::YES"|enum && $img_video.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$img_video.tablet.icon.image_path}" srcset="{$img_video.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_video.desktop.image_id}" data-src="{$img_video.desktop.icon.image_path}" alt="{$img_video.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_video.desktop.image_id}" srcset="{$img_video.desktop.icon.image_path}" alt="{$img_video.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
        </figure>
        {if !empty($video.mobile.motivation_link) && empty($video.mobile.motivation_text)}</a>{/if}

    
    {* выключена видео мобилка > включен видео планшет *}
    {elseif $video.mobile_on == 'N' && $video.tablet_on == "YesNo::YES"|enum}
        {if !empty($video.tablet.motivation_link) && empty($video.tablet.motivation_text)}<a href="{$video.tablet.motivation_link|fn_url}"{if $video.tablet.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        <figure class="container-fluid-row">
            
            {* тип шаблона video *}
            <div class="bg {$video.tablet.image_scaling}" style="background-color:{if $video.tablet.image_bg_color_use == "YesNo::YES"|enum}{$video.tablet.image_bg_color}{else}{$video.desktop.image_bg_color}{/if};">
                {if $bg_video.tablet.icon.image_path || $video.tablet.background_video_webm || $video.tablet.background_video_mp4}
                    <video muted autoplay loop playsinline class="image-entity banner__bg swiper-lazy" data-src="{if !empty($video.tablet.background_video_webm) || !empty($video.desktop.background_video_webm)}{if !empty($video.tablet.background_video_webm)}{$video.tablet.background_video_webm}{else}{$video.desktop.background_video_webm}{/if}{/if}{if !empty($video.tablet.background_video_mp4) || !empty($video.desktop.background_video_mp4)}{if !empty($video.tablet.background_video_mp4)}{$video.tablet.background_video_mp4}{else}{$video.desktop.background_video_mp4}{/if}{/if}" poster="{if $bg_video.tablet.icon.image_path}{$bg_video.tablet.icon.image_path}{else}{$bg_video.desktop.icon.image_path}{/if}"></video>
                    <div class="swiper-lazy-preloader"></div>
                {/if}
            </div>
            {* / тип шаблона video *}
        
            {* video content *}
            <figcaption class="ext_banner {$video.tablet.image_position} {$video.tablet.color_scheme}">
                <div class="ext_banner__content {$video.tablet.content_valign} {$video.tablet.content_align}" style="padding:{$video.tablet.padding|default:"0px"};">
                    {if $video.tablet.title_text !=""}<{$video.tablet.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$video.tablet.title_font_size|default:"40px"}; font-weight:{$video.tablet.title_font_weight};{if $video.tablet.title_font_color_use == "YesNo::YES"|enum}color:{$video.tablet.title_font_color};{/if}">{$video.tablet.title_text nofilter}</{$video.tablet.title_tag|default:div}>{/if}
                        {if $video.tablet.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$video.tablet.description_font_size|default:"18px"};{if $video.tablet.description_font_color_use == "YesNo::YES"|enum} color:{$video.tablet.description_font_color};{/if}">
                            <p>{$video.tablet.description_text nofilter}</p>
                        </div>{/if}
                    {if !empty($video.tablet.motivation_link) && !empty($video.tablet.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$video.tablet.motivation_font_size|default:"20px"};{if $video.tablet.motivation_font_color_use == "YesNo::YES"|enum}color:{$video.tablet.motivation_font_color};{/if}{if $video.tablet.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$video.tablet.motivation_button_color};{/if}" href="{$video.tablet.motivation_link|fn_url}" {if $video.tablet.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$video.tablet.motivation_text|strip_tags}">{$video.tablet.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image">
                    <picture>
                        {if $video.mobile_on == "YesNo::YES"|enum && $img_video.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$img_video.mobile.icon.image_path}" srcset="{$img_video.mobile.icon.image_path}">{/if}
                        {if $video.tablet_on == "YesNo::YES"|enum && $img_video.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$img_video.tablet.icon.image_path}" srcset="{$img_video.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_video.desktop.image_id}" data-src="{$img_video.desktop.icon.image_path}" alt="{$img_video.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_video.desktop.image_id}" srcset="{$img_video.desktop.icon.image_path}" alt="{$img_video.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
            {* / video content *}

        </figure>
        {if !empty($video.tablet.motivation_link) && empty($video.tablet.motivation_text)}</a>{/if}


    {* выключена видео мобилка и выключен видео планшет > отображаем версию видео десктоп *}
    {else}
        {if !empty($video.desktop.motivation_link) && empty($video.desktop.motivation_text)}<a href="{$video.desktop.motivation_link|fn_url}"{if $video.desktop.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        <figure class="container-fluid-row">
            
            {* тип шаблона video *}
            <div class="bg {$video.desktop.image_scaling}"{if $video.desktop.image_bg_color_use == "YesNo::YES"|enum} style="background-color:{$video.desktop.image_bg_color};"{/if}>
                {if $bg_video.desktop.icon.image_path || $video.desktop.background_video_webm || $video.desktop.background_video_mp4}
                    <video muted autoplay loop playsinline class="image-entity banner__bg swiper-lazy" data-src="{if $video.desktop.background_video_webm !== ""}{$video.desktop.background_video_webm}{/if}{if $video.desktop.background_video_mp4 !== ""}{$video.desktop.background_video_mp4}{/if}" poster="{$bg_video.desktop.icon.image_path}"></video>
                    <div class="swiper-lazy-preloader"></div>
                {/if}
            </div>
            {* / тип шаблона video *}
            
            <figcaption class="ext_banner {$video.desktop.image_position} {$video.desktop.color_scheme}">
                <div class="ext_banner__content {$video.desktop.content_valign} {$video.desktop.content_align}" style="padding:{$video.desktop.padding|default:"0px"};">
                    {if $video.desktop.title_text !=""}<{$video.desktop.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$video.desktop.title_font_size|default:"40px"}; font-weight:{$video.desktop.title_font_weight};{if $video.desktop.title_font_color_use == "YesNo::YES"|enum}color:{$video.desktop.title_font_color};{/if}">{$video.desktop.title_text nofilter}</{$video.desktop.title_tag|default:div}>{/if}
                {if $video.desktop.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$video.desktop.description_font_size|default:"18px"};{if $video.desktop.description_font_color_use == "YesNo::YES"|enum} color:{$video.desktop.description_font_color};{/if}">
                    <p>{$video.desktop.description_text nofilter}</p>
                    </div>{/if}
                {if !empty($video.desktop.motivation_link) && !empty($video.desktop.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$video.desktop.motivation_font_size|default:"20px"};{if $video.desktop.motivation_font_color_use == "YesNo::YES"|enum}color:{$video.desktop.motivation_font_color};{/if}{if $video.desktop.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$video.desktop.motivation_button_color};{/if}" href="{$video.desktop.motivation_link|fn_url}" {if $video.desktop.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$video.desktop.motivation_text|strip_tags}">{$video.desktop.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image">
                    <picture>
                        {if $video.mobile_on == "YesNo::YES"|enum && $img_video.mobile.icon.image_path !=""}<source media="(max-width: 767px)" data-src="{$img_video.mobile.icon.image_path}" srcset="{$img_video.mobile.icon.image_path}">{/if}
                        {if $video.tablet_on == "YesNo::YES"|enum && $img_video.tablet.icon.image_path !=""}<source media="(max-width: 1023px)" data-src="{$img_video.tablet.icon.image_path}" srcset="{$img_video.tablet.icon.image_path}">{/if}
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_video.desktop.image_id}" data-src="{$img_video.desktop.icon.image_path}" alt="{$img_video.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_video.desktop.image_id}" srcset="{$img_video.desktop.icon.image_path}" alt="{$img_video.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
        </figure>
        {if !empty($video.desktop.motivation_link) && empty($video.desktop.motivation_text)}</a>{/if}
    {/if}



{/if}

</div>


{/foreach}
{/strip}
{/capture}