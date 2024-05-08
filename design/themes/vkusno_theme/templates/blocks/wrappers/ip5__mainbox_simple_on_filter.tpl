{if $content|trim}
    <div class="ip5_filter_content clearfix{if isset($hide_wrapper)} cm-hidden-wrapper{/if}{if $hide_wrapper} hidden{/if}{if $block.user_class} {$block.user_class}{/if}">
        {if $title || $smarty.capture.title|trim}
            <div class="ip5_filter_top">
                <span class="vk-close ip5_filter_close_btn"></span>
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
        <div class="ip5_filter_bottom">{$content nofilter}</div>
    </div>
{/if}
