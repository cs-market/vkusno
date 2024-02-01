{assign var="dropdown_id" value=$block.snapping_id}
{assign var="r_url" value=$config.current_url|escape:url}
{hook name="checkout:cart_content"}
    <div class="ty-dropdown-box" id="cart_status_{$dropdown_id}">
        <div id="sw_dropdown_{$dropdown_id}" class="ty-dropdown-box__title cm-combination">
            <a href="{"checkout.cart"|fn_url}">
                {hook name="checkout:dropdown_title"}
                    <span class="title_img">
                         <img src="{$self_images_dir}/cart.svg" class="ty-minicart-title-img" alt=""/>
                         {if $smarty.session.cart.amount}
                             <span class="count">{$smarty.session.cart.amount}</span>
                         {/if}
                    </span>
                    <span class="ty-minicart-title">{__("view_cart")}</span>
                {/hook}
            </a>
        </div>
        <div id="dropdown_{$dropdown_id}"
             class="cm-popup-box ty-dropdown-box__content ty-dropdown-box__content--cart hidden">
            {hook name="checkout:minicart"}
                <div
                    class="cm-cart-content {if $block.properties.products_links_type == "thumb"}cm-cart-content-thumb{/if} {if $block.properties.display_delete_icons == "Y"}cm-cart-content-delete{/if}">
                    {if $smarty.session.cart.amount}

                        <div class="ty-cart-top">
                            <p>{__("view_cart")}</p>
                            <span>{__("clear")}</span>
                        </div>
                    <div class="ty-cart-items">

                            <ul class="ty-cart-items__list">
                                {hook name="index:cart_status"}
                                {assign var="_cart_products" value=$smarty.session.cart.products|array_reverse:true}
                                {foreach from=$_cart_products key="key" item="product" name="cart_products"}
                                    {hook name="checkout:minicart_product"}
                                    {if !$product.extra.parent}
                                        <li class="ty-cart-items__list-item">
                                            {hook name="checkout:minicart_product_info"}
                                            {if $block.properties.products_links_type == "thumb"}
                                                <div class="ty-cart-items__list-item-image">
                                                    {include file="common/image.tpl" image_width="64" image_height="56" images=$product.main_pair no_ids=true}
                                                </div>
                                            {/if}
                                                <div class="ty-cart-items__list-item-desc">
                                                    <a href="{"products.view?product_id=`$product.product_id`"|fn_url}">{$product.product|default:fn_get_product_name($product.product_id) nofilter}</a>
                                                    <p>
{*                                                        <span>{$product.amount}</span><span dir="{$language_direction}">&nbsp;x&nbsp;</span>*}
                                                        {include file="common/price.tpl" value=$product.display_price span_id="price_`$key`_`$dropdown_id`" class="none"}

                                                        <span class="weight">190 г</span>
                                                    </p>
                                                </div>



                                                <div class="ty-cart-content__product-elem ty-cart-content__qty {if $product.is_edp == "Y" || $product.exclude_from_calculate} quantity-disabled{/if}">
                                                    {if $use_ajax == true && $cart.amount != 1}
                                                        {assign var="ajax_class" value="cm-ajax"}
                                                    {/if}

                                                    <div class="quantity cm-reload-{$obj_id}{if $settings.Appearance.quantity_changer == "Y"} changer{/if}" id="quantity_update_{$obj_id}">
                                                        <input type="hidden" name="cart_products[{$key}][product_id]" value="{$product.product_id}" />
                                                        {if $product.exclude_from_calculate}<input type="hidden" name="cart_products[{$key}][extra][exclude_from_calculate]" value="{$product.exclude_from_calculate}" />{/if}

                                                        <label for="amount_{$key}"></label>
                                                        {if $product.is_edp == "Y" || $product.exclude_from_calculate}
                                                            {$product.amount}
                                                        {else}
                                                            {if $settings.Appearance.quantity_changer == "Y"}
                                                                <div class="ty-center ty-value-changer cm-value-changer">
                                                                <a class="cm-increase ty-value-changer__increase"><span class="vk-plus"></span></a>
                                                            {/if}
                                                            <input type="text" size="3" id="amount_{$key}" name="cart_products[{$key}][amount]" value="{$product.amount}" class="ty-value-changer__input cm-amount cm-value-decimal"{if $product.qty_step > 1} data-ca-step="{$product.qty_step}"{/if} data-ca-min-qty="{if !$product.min_qty}{$default_minimal_qty}{else}{$product.min_qty}{/if}" />
                                                            {if $settings.Appearance.quantity_changer == "Y"}
                                                                <a class="cm-decrease ty-value-changer__decrease"><span class="vk-minus"></span></a>
                                                                </div>
                                                            {/if}
                                                        {/if}
                                                        {if $product.is_edp == "Y" || $product.exclude_from_calculate}
                                                            <input type="hidden" name="cart_products[{$key}][amount]" value="{$product.amount}" />
                                                        {/if}
                                                        {if $product.is_edp == "Y"}
                                                            <input type="hidden" name="cart_products[{$key}][is_edp]" value="Y" />
                                                        {/if}
                                                        <!--quantity_update_{$obj_id}--></div>
                                                </div>


                                            {if $block.properties.display_delete_icons == "Y"}
                                                <div class="ty-cart-items-delete cm-cart-item-delete hidden">
                                                    {if (!$runtime.checkout || $force_items_deletion) && !$product.extra.exclude_from_calculate}
                                                        {include file="buttons/button.tpl" but_href="checkout.delete.from_status?cart_id=`$key`&redirect_url=`$r_url`" but_meta="cm-ajax cm-ajax-full-render" but_target_id="cart_status*" but_role="delete" but_name="delete_cart_item"}
                                                    {/if}
                                                </div>
                                            {/if}
                                            {/hook}
                                        </li>
                                    {/if}
                                    {/hook}
                                {/foreach}
                                {/hook}
                            </ul>


                    </div>

                    {else}
                        <div class="ty-cart-items__empty ty-center">
                            <p>{__("text_cart_empty")}</p>
                            <img src="{$self_images_dir}/cart_empty.svg" class="ty-cart_empty-img" alt=""/>
                        </div>
                    {/if}
                    {if $block.properties.display_bottom_buttons == "Y"}
                        <div
                            class="cm-cart-buttons ty-cart-content__buttons buttons-container{if $smarty.session.cart.amount} full-cart{else} hidden{/if}">
{*                            <div class="ty-float-left">*}
{*                                <a href="{"checkout.cart"|fn_url}" rel="nofollow"*}
{*                                   class="ty-btn ty-btn__secondary">{__("view_cart")}</a>*}
{*                            </div>*}
                            {if $settings.Checkout.checkout_redirect != "Y"}
{*                                <div class="ty-float-right">*}
                                <div class="ip5_btn">
                                    {include file="buttons/proceed_to_checkout.tpl" but_text=__("checkout")}
                                        <span>{include file="common/price.tpl" value=$_total|default:$cart.total}</span>
                                </div>

{*                                </div>*}
                            {/if}
                        </div>
                    {/if}

                </div>
            {/hook}
        </div>
        <!--cart_status_{$dropdown_id}--></div>
{/hook}
