{if $products}

    {script src="js/tygh/exceptions.js"}
    {script src="js/tygh/cart_content.js"}

    {if !$no_pagination}
        {include file="common/pagination.tpl"}
    {/if}

    {if !$no_sorting}
        {include file="views/products/components/sorting.tpl"}
    {/if}

    {if !$show_empty}
        {split data=$products size=$columns|default:"2" assign="splitted_products"}
    {else}
        {split data=$products size=$columns|default:"2" assign="splitted_products" skip_complete=true}
    {/if}

    {math equation="100 / x" x=$columns|default:"2" assign="cell_width"}
    {if $item_number == "Y"}
        {assign var="cur_number" value=1}
    {/if}

    {* FIXME: Don't move this file *}
    {script src="js/tygh/product_image_gallery.js"}

    {if $settings.Appearance.enable_quick_view == 'Y'}
        {$quick_nav_ids = $products|fn_fields_from_multi_level:"product_id":"product_id"}
    {/if}
    <div class="grid-list">
        {strip}
            {$cart_products = $smarty.session.cart.products|array_column:'product_id'}
            {foreach from=$splitted_products item="sproducts" name="sprod"}
                {foreach from=$sproducts item="product" name="sproducts"}
                    <div class="ty-column{$columns}">
                        {if $product}
                            {assign var="obj_id" value=$product.product_id}
                            {assign var="obj_id_prefix" value="`$obj_prefix``$product.product_id`"}
                            {include file="common/product_data.tpl" product=$product}

                            <div class="ty-grid-list__item ty-quick-view-button__wrapper
                                {if $settings.Appearance.enable_quick_view == 'Y' || $show_features} ty-grid-list__item--overlay{/if}">
                                {assign var="form_open" value="form_open_`$obj_id`"}
                                {$smarty.capture.$form_open nofilter}
                                {hook name="products:product_multicolumns_list"}
                                        <div class="ty-grid-list__image">
                                            {include file="views/products/components/product_icon.tpl" product=$product show_gallery=true}

                                            {assign var="product_labels" value="product_labels_`$obj_prefix``$obj_id`"}
                                            {$smarty.capture.$product_labels nofilter}
                                        </div>

                                        {hook name="products:list_price_block"}
                                            <div class="ty-grid-list__price {if $product.price == 0}ty-grid-list__no-price{/if}">
                                                {assign var="price" value="price_`$obj_id`"}
                                                {$smarty.capture.$price nofilter}

                                                {assign var="old_price" value="old_price_`$obj_id`"}
                                                {if $smarty.capture.$old_price|trim}{$smarty.capture.$old_price nofilter}{/if}

                                                {assign var="clean_price" value="clean_price_`$obj_id`"}
                                                {$smarty.capture.$clean_price nofilter}

                                                {assign var="list_discount" value="list_discount_`$obj_id`"}
                                                {$smarty.capture.$list_discount nofilter}
                                            </div>
                                        {/hook}

                                        <div class="ty-grid-list__item-name">
                                            {if $item_number == "Y"}
                                                <span class="item-number">{$cur_number}.&nbsp;</span>
                                                {math equation="num + 1" num=$cur_number assign="cur_number"}
                                            {/if}

                                            {assign var="name" value="name_$obj_id"}
                                            <bdi>{$smarty.capture.$name nofilter}</bdi>
                                        </div>

                                    <div class="grid-list__content">
                                        {assign var="rating" value="rating_$obj_id"}
                                        {if $smarty.capture.$rating}
                                            <div class="grid-list__rating">
                                                {*                                                {$smarty.capture.$rating nofilter}*}

                                                {if $product.average_rating}
                                                    <p>{$product.average_rating|truncate:3:""}</p>
                                                    <span class="vk-star"></span>
                                                {else}
                                                    <p>0.0</p>
                                                    <span class="vk-star"></span>
                                                {/if}
                                            </div>
                                        {/if}

                                        <div class="grid-list__label">
                                            <span class="lactose_free">Без лактозы</span>
                                        </div>
                                    </div>



                                        {capture name="product_multicolumns_list_control_data_wrapper"}
                                            <div class="ty-grid-list__control cm-product-controls {if $obj_id|in_array:$cart_products}in-cart{/if} {if $product.is_weighted == 'Y'}is-weighted{/if}">
                                                {hook name="products:product_multicolumns_list_control_data_wrapper"}
                                                {assign var="qty" value="qty_`$obj_id`"}
                                                {if $smarty.capture.$qty|trim}
                                                    <div class="ty-grid-list__qty {if $obj_id|in_array:$cart_products}ty-cart-content__qty{/if}">
                                                        {$smarty.capture.$qty nofilter}
                                                    </div>
                                                    {include file="buttons/update_cart.tpl"
                                                    but_id="button_cart"
                                                    but_meta="ty-btn--recalculate-cart hidden hidden-phone hidden-tablet"
                                                    but_name="dispatch[checkout.update_qty]"
                                                    }
                                                {/if}

                                                {capture name="product_multicolumns_list_control_data"}
                                                    {hook name="products:product_multicolumns_list_control"}
                                                        {if $settings.Appearance.enable_quick_view == 'Y'}
                                                            {include file="views/products/components/quick_view_link.tpl" quick_nav_ids=$quick_nav_ids}
                                                        {/if}

                                                        {if $show_add_to_cart}
                                                            <div class="button-container">
                                                                {$add_to_cart = "add_to_cart_`$obj_id`"}
                                                                {$smarty.capture.$add_to_cart nofilter}

                                                                {if !$hide_wishlist_button}
                                                                    {include file="addons/wishlist/views/wishlist/components/add_to_wishlist.tpl" but_id="button_wishlist_`$obj_prefix``$product.product_id`" but_name="dispatch[wishlist.add..`$product.product_id`]" but_text="В избранное" but_meta="ty-btn__tertiary ty-add-to-wish ty-product-block__btn {if $in_wishlist_flag == true}has_inwishlist{/if}"}
                                                                {/if}
                                                            </div>
                                                        {/if}
                                                    {/hook}
                                                {/capture}
                                                {$smarty.capture.product_multicolumns_list_control_data nofilter}
                                                {/hook}
                                                </div>
                                        {/capture}

                                        {if $smarty.capture.product_multicolumns_list_control_data|trim}
                                            {$smarty.capture.product_multicolumns_list_control_data_wrapper nofilter}
                                        {/if}
                                {/hook}
                                {hook name="products:product_list_form_close_tag"}
                                    {$form_close="form_close_`$obj_id`"}
                                    {$smarty.capture.$form_close nofilter}
                                {/hook}
                            </div>
                        {/if}
                    </div>
                {/foreach}
                {if $show_empty && $smarty.foreach.sprod.last}
                    {assign var="iteration" value=$smarty.foreach.sproducts.iteration}
                    {capture name="iteration"}{$iteration}{/capture}
                    {hook name="products:products_multicolumns_extra"}
                    {/hook}
                    {assign var="iteration" value=$smarty.capture.iteration}
                    {if $iteration % $columns != 0}
                        {math assign="empty_count" equation="c - it%c" it=$iteration c=$columns}
                        {section loop=$empty_count name="empty_rows"}
                            <div class="ty-column{$columns}">
                                <div class="ty-product-empty">
                                    <span class="ty-product-empty__text">{__("empty")}</span>
                                </div>
                            </div>
                        {/section}
                    {/if}
                {/if}
            {/foreach}
        {/strip}
    </div>

    {if !$no_pagination}
        {include file="common/pagination.tpl"}
    {/if}

{/if}

{capture name="mainbox_title"}{$title}{/capture}
