{if !$cart|fn_cart_is_empty}
    {if $content|trim}
        <div class="ip5-total_content{if isset($hide_wrapper)} cm-hidden-wrapper{/if}{if $hide_wrapper} hidden{/if}{if $block.user_class} {$block.user_class}{/if}{if $content_alignment == "RIGHT"} ty-float-right{elseif $content_alignment == "LEFT"} ty-float-left{/if}">
            {if $title || $smarty.capture.title|trim}
                <div class="ip5-total_title">
                    <h2>
                        {hook name="wrapper:mainbox_simple_title"}
                        {if $smarty.capture.title|trim}
                            {$smarty.capture.title nofilter}
                        {else}
                            {$title nofilter}
                        {/if}
                        {/hook}
                    </h2>
                </div>
            {/if}
            <div class="ip5-total_body">{$content nofilter}</div>
            {if $payment_methods}
                <div class="ip5_btn">
                    <span>{__("ip5_theme_addon.shipping_to")}</span>
                    <div>
                        {assign var="link_href" value="checkout.checkout"}
                        {include file="buttons/proceed_to_checkout.tpl"}
                        <span>{include file="common/price.tpl" value=$_total|default:$cart.total}</span>
                    </div>
                </div>
            {/if}
        </div>
    {/if}
{/if}
