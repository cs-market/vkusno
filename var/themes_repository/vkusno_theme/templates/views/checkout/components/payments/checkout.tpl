<div class="ip5_checkout_payment__select">

{*    {if $block.properties.abt__ut2_as_select == "YesNo::YES"|enum}*}
        <label class="ip5_checkout_payment__opted" for="open-checkout_payment-list-dropdown">
            {if $payment_methods.{$cart.payment_id}.image}
                <div class="ip5_checkout_payment__opted__logo">
                    {include file="common/image.tpl" obj_id=$cart.payment_id images=$payment_methods.{$cart.payment_id}.image class="litecheckout__payment-method__logo-image"}
                </div>
            {/if}
            <div class="ip5_checkout_payment__opted__text">
                <div class="ip5_checkout_payment__opted__text__title">
                    {$payment_methods.{$cart.payment_id}.payment}
                </div>
            </div>
            <div class="ip5_checkout_payment__opted__icon vk-arrow"></div>
        </label>
        {*{fn_print_r($payment_methods.{$cart.payment_id})}*}
        <input id="open-checkout_payment-list-dropdown" type="checkbox"/>
{*    {/if}*}

    <div class="ip5_checkout_payment__list">

        {foreach $payment_methods as $payment}
        <div class="ip5_checkout_payment__unit {if $payment.payment_id == $cart.payment_id}ip5_checkout_payment__unit_active{/if} litecheckout__shipping-method litecheckout__field litecheckout__field--xsmall">
            <input type="radio"
                   name="selected_payment_method"
                   id="radio_{$payment.payment_id}"
                   data-ca-target-form="litecheckout_payments_form"
                   data-ca-url="checkout.checkout"
                   data-ca-result-ids="litecheckout_final_section,litecheckout_step_payment,shipping_rates_list,litecheckout_terms,checkout*"
                   class="litecheckout__shipping-method__radio cm-select-payment hidden"
                   value="{$payment.payment_id}"
                   {if $payment.payment_id == $cart.payment_id}checked{/if}
            />

        <label id="payments_{$payment.payment_id}" class="ip5_checkout_payment__unit__label litecheckout__shipping-method__wrapper js-litecheckout-toggle"
               for="radio_{$payment.payment_id}"
               data-ca-toggling="payments_form_wrapper_{$payment.payment_id}"
               data-ca-hide-all-in=".litecheckout__payment-methods"
        >

            {if $payment.image}
                <div class="ip5_checkout_payment__unit__label__logo litecheckout__payment-method__logo">
                    {include file="common/image.tpl" obj_id=$payment.payment_id images=$payment.image class="litecheckout__payment-method__logo-image"}
                </div>
            {/if}

            <div class="ip5_checkout_payment__unit__label__text">
                <div class="litecheckout__shipping-method__title">
                    {$payment.payment}
                </div>
                <div class="ip5_checkout_payment__unit__label__text__beside-title">
                    <div class="litecheckout__shipping-method__delivery-time">
                        {$payment.description}
                    </div>
                </div>
                <div class="ip5_checkout_payment__unit__label__text__pseudo-radio"></div>
            </div>

            </label>{* /.ip5_checkout_payment__unit__label *}

{*            {if $block.properties.abt__ut2_as_select == "YesNo::NO"|enum}*}
                <div class="ip5_checkout_payment__unit__details">
                <div class="ip5_checkout_payment__unit__details__in">
                {if $payment.payment_id == $cart.payment_id}

                    {capture name="payment_template"}
                        {if $payment.template}
                            {include file=$payment.template card_id=$payment.payment_id}
                        {/if}
                    {/capture}

                    <div
                        class="litecheckout__group litecheckout__payment-method{if !$smarty.capture.payment_template|trim && !$payment.instructions|trim} hidden{/if}"
                        data-ca-toggling-by="payments_form_wrapper_{$payment.payment_id}"
                        data-ca-hideble="true"
                    >
                        <input type="hidden" name="payment_id" value="{$payment_id}"/>
                        <input type="hidden" name="result_ids" value="{$result_ids}"/>
                        <input type="hidden" name="dispatch" value="checkout.place_order"/>
                        <input type="hidden" name="customer_notes" value=""/>

                        {if $order_id}
                            <input type="hidden" name="order_id" value="{$order_id}"/>
                        {/if}

                        <input type="hidden" name="payment_id" value="{$payment.payment_id}"/>

                        {if $payment.instructions}
                            <div class="litecheckout__item litecheckout__payment-instructions">
                                {$payment.instructions nofilter}
                            </div>
                        {/if}

                        {$smarty.capture.payment_template nofilter}
                    </div>

                    {if $iframe_mode}
                        <div class="ty-payment-method-iframe__box">
                            <iframe width="100%" height="700"
                                    id="order_iframe_{$smarty.const.TIME}"
                                    src="{"checkout.process_payment"|fn_checkout_url:$smarty.const.AREA}"
                                    style="border: 0px" frameBorder="0"
                            ></iframe>
                            {if $is_terms_and_conditions_agreement_required}
                                <div id="payment_method_iframe_{$payment.payment_id}"
                                     class="ty-payment-method-iframe"
                                >
                                    <div class="ty-payment-method-iframe__label">
                                        <div class="ty-payment-method-iframe__text">
                                            {__("checkout_terms_n_conditions_alert")}
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    {/if}
                {/if}

                </div>{* /.ip5_checkout_payment__unit__details__in *}
                </div>{* /.ip5_checkout_payment__unit__details *}
{*            {/if}*}

            </div>{* /.ip5_checkout_payment__unit *}
        {/foreach}

    </div>{* /.ip5_checkout_payment__list *}

</div>{* /.ip5_checkout_payment__select *}

<div class="ip5_checkout_payment__select-details">
    <div class="ip5_checkout_payment__select-details__in">
        {foreach $payment_methods as $payment}

            {if $payment.payment_id != $cart.payment_id}
                {continue}
            {/if}
            <div class="litecheckout__group litecheckout__payment-method"
                 data-ca-toggling-by="payments_form_wrapper_{$payment.payment_id}"
                 data-ca-hideble="true"
            >
                <input type="hidden" name="payment_id" value="{$payment_id}"/>
                <input type="hidden" name="result_ids" value="{$result_ids}"/>
                <input type="hidden" name="dispatch" value="checkout.place_order"/>
                <input type="hidden" name="customer_notes" value=""/>

                {if $order_id}
                    <input type="hidden" name="order_id" value="{$order_id}"/>
                {/if}

                <input type="hidden" name="payment_id" value="{$payment.payment_id}"/>

                {if $payment.template}
                    {capture name="payment_template"}
                        {include file=$payment.template card_id=$payment.payment_id}
                    {/capture}
                {/if}

                {if $payment.instructions}
                    <div class="litecheckout__item litecheckout__payment-instructions">
                        {$payment.instructions nofilter}
                    </div>
                {/if}

                {if $payment.template && $smarty.capture.payment_template|trim != ""}
                    {$smarty.capture.payment_template nofilter}
                {/if}
            </div>
            {if $iframe_mode}
                <div class="ty-payment-method-iframe__box">
                    <iframe width="100%" height="700" id="order_iframe_{$smarty.const.TIME}"
                            src="{"checkout.process_payment"|fn_checkout_url:$smarty.const.AREA}"
                            style="border: 0px" frameBorder="0"
                    ></iframe>
                    {if $is_terms_and_conditions_agreement_required}
                        <div id="payment_method_iframe_{$payment.payment_id}"
                             class="ty-payment-method-iframe"
                        >
                            <div class="ty-payment-method-iframe__label">
                                <div class="ty-payment-method-iframe__text">{__("checkout_terms_n_conditions_alert")}</div>
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}

        {/foreach}
    </div>{* /.ip5_checkout_payment__select-details__in *}
</div>{* /.ip5_checkout_payment__select-details *}
