{if $order_info.delivery_date}
    {if $settings.Appearance.calendar_date_format == "month_first"}
        {assign var="date_format" value="%m/%d/%Y"}
    {else}
        {assign var="date_format" value="%d/%m/%Y"}
    {/if}
    <div class="ty-delivery_info__date">
        <p>{__("delivery_date")}</p>
        <span>{$order_info.delivery_date|date_format:"`$settings.Appearance.date_format|truncate:6:false`"}</span>
    </div>
    {if $order_info.delivery_period}
        <div class="ty-delivery_info__time">
            <p>{__("calendar_delivery.delivery_period")}</p>
            <span>{$order_info.delivery_period}</span>
        </div>
    {/if}
{/if}
