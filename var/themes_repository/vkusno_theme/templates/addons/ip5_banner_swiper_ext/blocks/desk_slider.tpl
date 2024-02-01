
{********************** Desktop banner *********************}

{capture name="desk_slider"}
{strip}
{foreach from=$items item='b' key='key'}
{$graphic_setts = $b.ip5_graphic_settings}{$graphic.tablet_on = $graphic_setts.enable_tablet}{$graphic.mobile_on = $graphic_setts.enable_mobile}{$graphic.desktop = $graphic_setts.desktop}{$graphic.tablet = $graphic_setts.tablet}{$graphic.mobile = $graphic_setts.mobile}{$img_graphic.desktop = $b.graphic_desktop_image_main}{$bg_graphic.desktop = $b.graphic_desktop_image_bg}{$img_graphic.tablet = $b.graphic_tablet_image_main}{$bg_graphic.tablet = $b.graphic_tablet_image_bg}{$img_graphic.mobile = $b.graphic_mobile_image_main}{$bg_graphic.mobile = $b.graphic_mobile_image_bg}{$video_setts = $b.ip5_video_settings}{$video.tablet_on = $video_setts.enable_tablet}{$video.mobile_on = $video_setts.enable_mobile}{$video.desktop = $video_setts.desktop}{$video.tablet = $video_setts.tablet}{$video.mobile = $video_setts.mobile}{$img_video.desktop = $b.video_desktop_image_main}{$bg_video.desktop = $b.video_desktop_image_bg}{$img_video.tablet = $b.video_tablet_image_main}{$bg_video.tablet = $b.video_tablet_image_bg}{$img_video.mobile = $b.video_mobile_image_main}{$bg_video.mobile = $b.video_mobile_image_bg}

    <div id="banner_d_{$b.banner_id}" class="desk swiper-slide {if $b.type == "C"}image {$graphic.desktop.custom_class} {else}{if $video.desktop.background_video_type == 'html5'}video_html5 {/if} {$video.desktop.custom_class}{/if}" style="{if $block.properties.min_height !=""}height:{$block.properties.min_height};{/if}">

{* {$video.desktop.motivation_link|fn_print_r} *}


        {if $b.type == "C"}
            {if !empty($graphic.desktop.motivation_link) && empty($graphic.desktop.motivation_text)}<a href="{$graphic.desktop.motivation_link|fn_url}"{if $graphic.desktop.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        {else}
            {if !empty($video.desktop.motivation_link) && empty($video.desktop.motivation_text)}<a href="{$video.desktop.motivation_link|fn_url}"{if $video.desktop.motivation_open_new_window == "YesNo::YES"|enum} target="_blank"{/if}>{/if}
        {/if}
        <figure class="container-fluid-row">

            {if $b.type == "C"}
                {* тип шаблона image *}
                <div class="bg {$graphic.desktop.image_scaling}"{if $graphic.desktop.image_bg_color_use == "YesNo::YES"|enum} style="background-color:{$graphic.desktop.image_bg_color};"{/if}>
                    <picture>
                        {if $block.properties.lazyLoad == "O" && !empty($b.graphic_desktop_image_bg)}
                            <img class="image-entity banner__bg swiper-lazy" data-src="{$bg_graphic.desktop.icon.image_path}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAQAAAAD+Fb1AAAADklEQVR42mNkgAJG3AwAAH4ABWjFc8IAAAAASUVORK5CYII=" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            {if !empty($b.graphic_desktop_image_bg)}<img class="image-entity banner__bg" srcset="{$bg_graphic.desktop.icon.image_path}" alt="{$bg_graphic.desktop.icon.alt|strip_tags}">{/if}
                        {/if}
                    </picture>
                </div>
                {* / тип шаблона image *}
            {else}
                {* тип шаблона video *}
                <div class="bg {$video.desktop.image_scaling}"{if $video.desktop.image_bg_color_use == "YesNo::YES"|enum} style="background-color:{$video.desktop.image_bg_color};"{/if}>
                    {if $bg_video.desktop.icon.image_path || $video.desktop.background_video_webm || $video.desktop.background_video_mp4}
                        <video muted autoplay loop playsinline class="image-entity banner__bg swiper-lazy" data-src="{if $video.desktop.background_video_webm !== ""}{$video.desktop.background_video_webm}{/if}{if $video.desktop.background_video_mp4 !== ""}{$video.desktop.background_video_mp4}{/if}" poster="{$bg_video.desktop.icon.image_path}"></video>
                        <div class="swiper-lazy-preloader"></div>
                    {/if}
                </div>
                {* / тип шаблона video *}
            {/if}
            

            
            {if $b.type == "C"}

            {* image content *}
            <figcaption class="ext_banner {$graphic.desktop.image_position} {$graphic.desktop.color_scheme}">
                {assign var="max_width" value="100%"}
                <div class="ext_banner__content {$graphic.desktop.content_valign} {$graphic.desktop.content_align}" style="width:{$graphic.desktop.content_width|default:"50%"}; padding:{$graphic.desktop.padding|default:"0px"};">
                    {if $graphic.desktop.title_text !=""}<{$graphic.desktop.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$graphic.desktop.title_font_size|default:"40px"}; font-weight:{$graphic.desktop.title_font_weight};{if $graphic.desktop.title_font_color_use == "YesNo::YES"|enum}color:{$graphic.desktop.title_font_color};{/if}">{$graphic.desktop.title_text nofilter}</{$graphic.desktop.title_tag|default:div}>{/if}
                        {if $graphic.desktop.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$graphic.desktop.description_font_size|default:"18px"};{if $graphic.desktop.description_font_color_use == "YesNo::YES"|enum} color:{$graphic.desktop.description_font_color};{/if}">
                            <p>{$graphic.desktop.description_text nofilter}</p>
                        </div>{/if}
                    {if !empty($graphic.desktop.motivation_link) && !empty($graphic.desktop.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$graphic.desktop.motivation_font_size|default:"20px"};{if $graphic.desktop.motivation_font_color_use == "YesNo::YES"|enum}color:{$graphic.desktop.motivation_font_color};{/if}{if $graphic.desktop.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$graphic.desktop.motivation_button_color};{/if}" href="{$graphic.desktop.motivation_link|fn_url}" {if $graphic.desktop.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$graphic.desktop.motivation_text|strip_tags}">{$graphic.desktop.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image" style="width:{($max_width - {$graphic.desktop.content_width|default:"50%"})|string_format:"%d%%"}">
                    <picture>
                        {if $block.properties.lazyLoad == "O"}
                            <img class="ty-pict image-entity banner__image cm-image swiper-lazy" id="det_img_{$img_graphic.desktop.image_id}" data-src="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                            <div class="swiper-lazy-preloader"></div>
                        {else}
                            <img class="ty-pict image-entity banner__image cm-image" id="det_img_{$img_graphic.desktop.image_id}" srcset="{$img_graphic.desktop.icon.image_path}" alt="{$img_graphic.desktop.icon.alt|strip_tags}">
                        {/if}
                    </picture>
                </div>
            </figcaption>
            {* / image content *}

            {else}

            {* video content *}
            <figcaption class="ext_banner {$video.desktop.image_position} {$video.desktop.color_scheme}">
                {assign var="max_width" value="100%"}
                <div class="ext_banner__content {$video.desktop.content_valign} {$video.desktop.content_align}" style="width:{$video.desktop.content_width|default:"50%"}; padding:{$video.desktop.padding|default:"0px"};">
                    {if $video.desktop.title_text !=""}<{$video.desktop.title_tag|default:div} class="ext_banner__content--title" style="font-size:{$video.desktop.title_font_size|default:"40px"}; font-weight:{$video.desktop.title_font_weight};{if $video.desktop.title_font_color_use == "YesNo::YES"|enum}color:{$video.desktop.title_font_color};{/if}">{$video.desktop.title_text nofilter}</{$video.desktop.title_tag|default:div}>{/if}
                        {if $video.desktop.description_text!=""}<div class="ext_banner__content--text" style="font-size:{$video.desktop.description_font_size|default:"18px"};{if $video.desktop.description_font_color_use == "YesNo::YES"|enum} color:{$video.desktop.description_font_color};{/if}">
                            <p>{$video.desktop.description_text nofilter}</p>
                        </div>{/if}
                    {if !empty($video.desktop.motivation_link) && !empty($video.desktop.motivation_text)}<div class="ext_banner__content--url"><a class="ty-btn ty-btn__primary" style="font-size:{$video.desktop.motivation_font_size|default:"20px"};{if $video.desktop.motivation_font_color_use == "YesNo::YES"|enum}color:{$video.desktop.motivation_font_color};{/if}{if $video.desktop.motivation_button_color_use == "YesNo::YES"|enum}background-color:{$video.desktop.motivation_button_color};{/if}" href="{$video.desktop.motivation_link|fn_url}" {if $video.desktop.motivation_open_new_window == "YesNo::YES"|enum}target="_blank"{/if} alt="{$video.desktop.motivation_text|strip_tags}">{$video.desktop.motivation_text nofilter}</a></div>{/if}
                </div>
                <div class="slide-image slide-media ext_banner__image" style="width:{($max_width - {$video.desktop.content_width|default:"50%"})|string_format:"%d%%"}">
                    <picture>
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

            {/if}
            

        </figure>
        {if $b.type == "C"}
            {if !empty($graphic.desktop.motivation_link) && empty($graphic.desktop.motivation_text)}</a>{/if}
        {else}
            {if !empty($video.desktop.motivation_link) && empty($video.desktop.motivation_text)}</a>{/if}
        {/if}


    </div>
{/foreach}
{/strip}
{/capture}
