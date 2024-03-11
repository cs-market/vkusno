{** block-description:my_account **}

{capture name="title"}
    {if $auth.user_id}
        <a class="ty-account-info__title" href="{"profiles.update"|fn_url}">
            <img src="{$self_images_dir}/user_pc.svg" class="ty-account-info__title-img" alt="" />
            {if $user_info.firstname || $user_info.lastname}
                <span class="ty-account-info__title-txt">{$user_info.firstname} {$user_info.lastname}</span>
            {else}
                <span class="ty-account-info__title-txt">{$user_info.email|truncate:4:"."}</span>
            {/if}
        </a>
{*    {else}*}
{*        <div class="ip5_login_btn"><a href="{"auth.login_form"|fn_url}" rel="nofollow">{__("sign_in")}</a></div>*}
    {/if}
{/capture}
{if $auth.user_id}
<div id="account_info_{$block.snapping_id}">
    {assign var="return_current_url" value=$config.current_url|escape:url}
    <ul class="ty-account-info">
        {hook name="profiles:my_account_menu"}
            {if $auth.user_id}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"orders.search"|fn_url}" rel="nofollow">{__("orders")}</a></li>
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"profiles.update"|fn_url}" rel="nofollow" >{__("profile_details")}</a></li>
                {if $settings.General.enable_edp == "Y"}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"orders.downloads"|fn_url}" rel="nofollow">{__("downloads")}</a></li>
                {/if}
           {/if}

            {if $settings.General.enable_compare_products == 'Y'}
                {$compared_products_ids = $smarty.session.comparison_list}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"product_features.compare"|fn_url}" rel="nofollow">{__("view_comparison_list")}{if $compared_products_ids} ({$compared_products_ids|count}){/if}</a></li>
            {/if}
        {/hook}
    </ul>

    {if $settings.Appearance.display_track_orders == 'Y'}
        <div class="ty-account-info__orders updates-wrapper track-orders" id="track_orders_block_{$block.snapping_id}">
            <form action="{""|fn_url}" method="POST" class="cm-ajax cm-post cm-ajax-full-render" name="track_order_quick">
                <input type="hidden" name="result_ids" value="track_orders_block_*" />
                <input type="hidden" name="return_url" value="{$smarty.request.return_url|default:$config.current_url}" />

                <div class="ty-account-info__orders-txt">{__("track_my_order")}</div>

                <div class="ty-account-info__orders-input ty-control-group ty-input-append">
                    <label for="track_order_item{$block.snapping_id}" class="cm-required hidden">{__("track_my_order")}</label>
                    <input type="text" size="20" class="ty-input-text cm-hint" id="track_order_item{$block.snapping_id}" name="track_data" value="{__("order_id")}{if !$auth.user_id}/{__("email")}{/if}" />
                    {include file="buttons/go.tpl" but_name="orders.track_request" alt=__("go")}
                    {include file="common/image_verification.tpl" option="track_orders" align="left" sidebox=true}
                </div>
            </form>
        <!--track_orders_block_{$block.snapping_id}--></div>
    {/if}

    <div class="ty-account-info__buttons buttons-container">
        {if $auth.user_id}
            {$is_vendor_with_active_company="MULTIVENDOR"|fn_allowed_for && ($auth.user_type == "V") && ($auth.company_status == "A")}
            {if $is_vendor_with_active_company}
                <a href="{fn_url("bottom_panel.login_as_vendor?url=`$config.current_url|urlencode`&area={"SiteArea::STOREFRONT"|enum}&user_id=`$auth.user_id`")}" rel="nofollow" class="ty-btn ty-btn__primary cm-post" target="_blank">{__("go_to_admin_panel")}</a>
            {/if}
            <a href="{"auth.logout?redirect_url=`$return_current_url`"|fn_url}" rel="nofollow" class="ty-btn {if $is_vendor_with_active_company}ty-btn__tertiary{else}ty-btn__primary{/if}">{__("sign_out")}</a>
{*        {else}*}
{*            <a href="{if $runtime.controller == "auth" && $runtime.mode == "login_form"}{$config.current_url|fn_url}{else}{"auth.login_form?return_url=`$return_current_url`"|fn_url}{/if}" data-ca-target-id="login_block{$block.snapping_id}" class="cm-dialog-opener cm-dialog-auto-size ty-btn ty-btn__secondary" rel="nofollow">{__("sign_in")}</a><a href="{"profiles.add"|fn_url}" rel="nofollow" class="ty-btn ty-btn__primary">{__("register")}</a>*}
{*            <div  id="login_block{$block.snapping_id}" class="hidden" title="{__("sign_in")}">*}
{*                <div class="ty-login-popup">*}
{*                    {include file="views/auth/login_form.tpl" style="popup" id="popup`$block.snapping_id`"}*}
{*                </div>*}
{*            </div>*}
        {/if}
    </div>
<!--account_info_{$block.snapping_id}--></div>
{/if}


{*<div class="ip5_user_phone">*}

{*    <div class="ip5_login">*}
{*        {include file="blocks/static_templates/login_btn.tpl"}*}
{*    </div>*}

{*    <div class="ip5_account_btn">*}
{*        {include file="blocks/static_templates/top_user_buttons.tpl"}*}

{*        {assign var="dropdown_id" value=$block.snapping_id}*}
{*        {assign var="r_url" value=$config.current_url|escape:url}*}
{*        <div class="ty-dropdown-box ip5_cart" id="cart_status_{$dropdown_id}">*}
{*            <a href="{"checkout.cart"|fn_url}">*}
{*                {hook name="checkout:dropdown_title"}*}
{*                    <span class="title_img">*}
{*                         <img src="{$self_images_dir}/cart.svg" class="ty-minicart-title-img" alt=""/>*}
{*                         {if $smarty.session.cart.amount}*}
{*                             <span class="count">{$smarty.session.cart.amount}</span>*}
{*                         {/if}*}
{*                    </span>*}
{*                    <span class="ty-minicart-title">{__("view_cart")}</span>*}
{*                {/hook}*}
{*            </a>*}
{*            <!--cart_status_{$dropdown_id}--></div>*}
{*    </div>*}

{*    <div class="top-quick-links">*}
{*        <b title="Быстрые ссылки" class="wysiwyg-block-loader cm-block-loader cm-block-loader--ROPm9DlRdo8="></b>*}
{*    </div>*}
{*    *}
{*    {include file="addons/call_requests/blocks/call_request.tpl"}*}

{*    <div class="ip5_phone">*}
{*        <a href="tel:84957807677"><img src="{$self_images_dir}/phone.svg" alt="" /> 8 (495) 780-76-77</a>*}
{*    </div>*}

{*    <div class="ip5_become_seller">*}
{*        <a href="/stat-prodavcom/">Стать продавцом</a>*}
{*    </div>*}
{*</div>*}

