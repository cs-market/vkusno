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
            <div id="checkout_info_summary_btn{$block.snapping_id}">
                {$show_place_order = false}

                {if $cart|fn_allow_place_order:$auth}
                    {$show_place_order = true}
                {/if}

                {if $recalculate && !$cart.amount_failed}
                    {$show_place_order = true}
                {/if}

                {if $show_place_order}

                    <input type="hidden" name="update_steps" value="1" />

                    {if !$iframe_mode}
                        <div class="ty-btn__primary ip5_submit_checkout_btn">{__("ip5_theme_addon.text_submit_checkout_button")}</div>
                    {/if}

                {else}
                    {include file="buttons/continue_shopping.tpl" but_href=$continue_url|fn_url but_role="action"}
                {/if}
                <!--checkout_info_summary_btn{$block.snapping_id}--></div>
        </div>
    {/if}
{/if}
