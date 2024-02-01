{** block-description:ip5_menu_mobile **}

<div class="ip5_menu_title">
    <img src="{$self_images_dir}/menu.svg" alt="" />
</div>

<div class="ip5_menu_body hidden">

    <div class="ip5_menu_top">
        {include file="addons/geo_maps/blocks/customer_location.tpl"}
        <img src="{$self_images_dir}/menu_close.jpg" class="ip5_close_btn" alt="" />
    </div>

    {include file="blocks/static_templates/search.tpl"}

    <div class="ip5_catalog">
        <h2 class="ty-mainbox-simple-title">
            {__("catalog")}
        </h2>
        <b title="Каталог" class="wysiwyg-block-loader cm-block-loader cm-block-loader--0ZJjx5aGHyc="></b>
    </div>

</div>


