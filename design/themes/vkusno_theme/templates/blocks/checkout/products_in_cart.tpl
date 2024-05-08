<div id="checkout_info_products_{$block.snapping_id}">
    <div class="ty-order-products__list order-product-list">
    {hook name="block_checkout:cart_items"}
        {foreach from=$cart_products key="key" item="product" name="cart_products"}
            {hook name="block_checkout:cart_products"}
                {if !$cart.products.$key.extra.parent}
                    <div class="ty-order-products__item">
                        <bdi><a class="litecheckout__order-products-p" href="{"products.view?product_id=`$product.product_id`"|fn_url}">{include file="common/image.tpl" obj_id=$key images=$product.main_pair image_width="auto" image_height="auto"}</a></bdi>
                        {if !$product.exclude_from_calculate}
                            {include file="buttons/button.tpl" but_href="checkout.delete?cart_id=`$key`&redirect_mode=`$runtime.mode`" but_meta="ty-order-products__item-delete delete" but_target_id="cart_status*" but_role="delete" but_name="delete_cart_item"}
                        {/if}
                        {hook name="products:product_additional_info"}
                        {/hook}
                        <div class="ty-order-products__price">
                            <span>{$product.amount} {__("items")}</span>
                        </div>
                        {include file="common/options_info.tpl" product_options=$product.product_options no_block=true}
                        {hook name="block_checkout:product_extra"}{/hook}
                    </div>
                {/if}
            {/hook}
        {/foreach}
        <div class="ip5_show_more">
            <span></span>
        </div>
    {/hook}
    </div>
<!--checkout_info_products_{$block.snapping_id}--></div>
