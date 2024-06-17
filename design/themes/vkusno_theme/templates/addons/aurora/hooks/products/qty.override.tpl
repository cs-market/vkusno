{hook name="products:qty"}
    <div class="cm-reload-{$obj_prefix}{$obj_id}" id="qty_update_{$obj_prefix}{$obj_id}">
    <input type="hidden" name="appearance[show_qty]" value="{$show_qty}" />
    <input type="hidden" name="appearance[capture_options_vs_qty]" value="{$capture_options_vs_qty}" />
    {if !empty($product.selected_amount)}
        {$default_amount = $product.selected_amount}
    {elseif !empty($product.min_qty)}
        {$default_amount = $product.min_qty}
    {elseif !empty($product.qty_step)}
        {$default_amount = $product.qty_step}
    {else}
        {$default_amount = "1"}
    {/if}

    {if $show_qty && $product.is_edp !== "Y" && $cart_button_exists == true && ($settings.Checkout.allow_anonymous_shopping == "allow_shopping" || $auth.user_id) && $product.avail_since <= $smarty.const.TIME || ($product.avail_since > $smarty.const.TIME && $product.out_of_stock_actions == "OutOfStockActions::BUY_IN_ADVANCE"|enum)}
        <div class="ty-qty clearfix{if $settings.Appearance.quantity_changer == "Y"} changer{/if}" id="qty_{$obj_prefix}{$obj_id}">
            {if !$hide_qty_label}<label class="ty-control-group__label" for="qty_count_{$obj_prefix}{$obj_id}">{$quantity_text|default:__("quantity")}:</label>{/if}
            <div class="ty-center ty-value-changer cm-value-changer">
                {if $settings.Appearance.quantity_changer == "Y"}
                    <a class="cm-increase ty-value-changer__increase">&#43;</a>
                {/if}
                <input {if $product.qty_step > 1}readonly="readonly"{/if} type="text" size="5" class="ty-value-changer__input cm-amount cm-value-decimal" id="qty_count_{$obj_prefix}{$obj_id}" name="product_data[{$obj_id}][amount]" value="{$default_amount}"{if $product.qty_step > 1} data-ca-step="{$product.qty_step}"{/if} data-ca-min-qty="{if $product.dynamic_quantity == "YesNo::YES"|enum}0{else}{$product.min_qty}{/if}" data-ca-val="{$default_amount}" />
                {if $settings.Appearance.quantity_changer == "Y"}
                    <a class="cm-decrease ty-value-changer__decrease">&minus;</a>
                {/if}
            </div>
        </div>
        {if $product.prices}
            {include file="views/products/components/products_qty_discounts.tpl"}
        {/if}
    {elseif !$bulk_add}
        <input type="hidden" name="product_data[{$obj_id}][amount]" value="{$default_amount}" />
    {/if}
    <!--qty_update_{$obj_prefix}{$obj_id}--></div>
{/hook}
