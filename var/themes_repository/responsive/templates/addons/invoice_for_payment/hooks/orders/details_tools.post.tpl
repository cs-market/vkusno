{if $order_info.payment_method.template == "addons/invoice_for_payment/views/orders/components/payments/invoice_payment.tpl"}
    {include file="buttons/button.tpl" but_role="text" but_meta="orders-print__pdf ty-btn__text cm-no-ajax" but_text=__("invoice_for_payment_pdf") but_href="orders.print_invoice_for_payment?order_id=`$order_info.order_id`&format=pdf" but_icon="ty-icon-doc-text orders-print__icon"}
{/if}
