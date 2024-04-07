{* Настройка блока *}
{include file="common/subheader.tpl" meta="" title=__("ip5_banner.params.main_settings") target="#ip5_banner_graphic_main_settings_`$device`"}
<div id="ip5_banner_graphic_main_settings_{$device}" class="in collapse">

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="color_scheme" device=$device banner_settings=$banner_settings variants=['light', 'dark'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="content_align" device=$device banner_settings=$banner_settings variants=['left', 'center', 'right'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="content_valign" device=$device banner_settings=$banner_settings variants=['top', 'middle', 'bottom'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="padding" device=$device banner_settings=$banner_settings default="0px" size="25" class=""}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="content_width" device=$device banner_settings=$banner_settings default="50%" size="10" class="input-small"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="custom_class" device=$device banner_settings=$banner_settings default="" size="50" class="input-large"}

</div>
<hr>

{* Настройка заголовка *}
{include file="common/subheader.tpl" meta="" title=__("ip5_banner.params.title_settings") target="#ip5_banner_graphic_title_settings_`$device`"}

<div id="ip5_banner_graphic_title_settings_{$device}" class="in collapse">

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="title_text" device=$device banner_settings=$banner_settings default="" size="100" class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="title_tag" device=$device banner_settings=$banner_settings variants=['div', 'h1', 'h2', 'h3'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="title_font_size" device=$device banner_settings=$banner_settings default="40px" size="10" class="input-small"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="title_font_weight" device=$device banner_settings=$banner_settings variants=['normal', 'bold'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/colorpicker.tpl" section=$section field="title_font_color" device=$device banner_settings=$banner_settings default="#ffffff" class=""}

</div>
<hr>

{* Настройка описания *}
{include file="common/subheader.tpl" meta="" title=__("ip5_banner.params.description_settings") target="#ip5_banner_graphic_description_settings_`$device`"}

<div id="ip5_banner_graphic_description_settings_{$device}" class="in collapse">

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/textarea.tpl" section=$section field="description_text" device=$device banner_settings=$banner_settings default="" size="100" class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="description_font_size" device=$device banner_settings=$banner_settings default="18px" size="10" class="input-small"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/colorpicker.tpl" section=$section field="description_font_color" device=$device banner_settings=$banner_settings default="#ffffff" class=""}

</div>
<hr>

{* Настройка картинок *}
{include file="common/subheader.tpl" meta="" title=__("ip5_banner.params.image_settings") target="#ip5_banner_graphic_image_settings_`$device`"}

<div id="ip5_banner_graphic_image_settings_{$device}" class="in collapse">

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="background_video_type" device=$device banner_settings=$banner_settings variants=['html5'] class="input-large"}
    {* {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="background_video_type" device=$device banner_settings=$banner_settings variants=['html5', 'youtube', 'vimeo'] class="input-large"} *}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="background_video_webm" device=$device banner_settings=$banner_settings default="" size="50" class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="background_video_mp4" device=$device banner_settings=$banner_settings default="" size="50" class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/image.tpl" section=$section field="image_main" device=$device banner_settings=$banner_settings banner_type=$banner_type}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="image_position" device=$device banner_settings=$banner_settings variants=['img_right', 'img_left'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/image.tpl" section=$section field="image_bg" device=$device banner_settings=$banner_settings banner_type=$banner_type}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/select.tpl" section=$section field="image_scaling" device=$device banner_settings=$banner_settings variants=['cover', 'contain'] class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/colorpicker.tpl" section=$section field="image_bg_color" device=$device banner_settings=$banner_settings default="#eeeeee" class=""}

</div>
<hr>

{* Настройка мотивации *}
{include file="common/subheader.tpl" meta="" title=__("ip5_banner.params.motivation_settings") target="#ip5_banner_graphic_motivation_settings_`$device`"}

<div id="ip5_banner_graphic_motivation_settings_{$device}" class="in collapse">

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="motivation_text" device=$device banner_settings=$banner_settings default="" size="100" class="input-large"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="motivation_font_size" device=$device banner_settings=$banner_settings default="20px" size="10" class="input-small"}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/colorpicker.tpl" section=$section field="motivation_font_color" device=$device banner_settings=$banner_settings default="#000000" class=""}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/colorpicker.tpl" section=$section field="motivation_button_color" device=$device banner_settings=$banner_settings default="#ffffff" class=""}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/checkbox.tpl" section=$section field="motivation_open_new_window" device=$device banner_settings=$banner_settings default="Y" class=""}

    {include file="addons/ip5_banner_swiper_ext/views/banners/components/text.tpl" section=$section field="motivation_link" device=$device banner_settings=$banner_settings default="" size="100" class="input-large"}

</div>
<hr>