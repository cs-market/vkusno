{if $order_info.allow_cancel == "YesNo::YES"|enum}
    {$deadline = $addons.specific_changes.order_cancel_ttl * 60 + $order_info.timestamp}
    {if $deadline >= $smarty.const.TIME}
        {__('specific_changes.deadline', ['[deadline]' => $deadline|date_format:$settings.Appearance.time_format])}
    {/if}
    {include file="buttons/button.tpl" but_meta="ty-btn__text cm-post" but_role="text" but_text=__("cancel_order") but_href="orders.cancel?order_id=`$order_info.order_id`" but_icon="ty-orders__actions-icon ty-icon-cancel"}
    {include file="buttons/button.tpl" but_meta="ty-btn__text cm-post" but_role="text" but_text=__("edit_order") but_href="orders.edit?order_id=`$order_info.order_id`" but_icon="ty-orders__actions-icon ty-icon-edit"}

{/if}
