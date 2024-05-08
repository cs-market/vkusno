{script src="js/tygh/exceptions.js"}
{script src="js/tygh/checkout.js"}
{script src="js/tygh/cart_content.js"}

<div id="cart_main">
    {if !$cart|fn_cart_is_empty}
        {include file="views/checkout/components/cart_content.tpl"}
    {else}
        <div class="ty-no-items">
            <img src="{$self_images_dir}/cart_empty.svg" class="ty-cart_empty-img" alt=""/>
            <p>{__("text_cart_empty")}</p>
        </div>
        <div class="buttons-container wrap">
            {include file="buttons/continue_shopping.tpl" but_href=$continue_url|fn_url but_role="submit"}
        </div>
    {/if}
<!--cart_main--></div>
