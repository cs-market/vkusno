{if $o.allow_cancel == "YesNo::YES"|enum}
    {include file="buttons/button.tpl" but_meta="ty-btn__text cm-post" but_role="text" but_text=__("ip5_theme_addon.edit_order") but_href="orders.edit?order_id=`$o.order_id`"}
{/if}
