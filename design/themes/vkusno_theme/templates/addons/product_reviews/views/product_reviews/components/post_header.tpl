{*
    $product_review
*}

<header class="ty-product-review-post-header">
    
    {if $product_review.product_options}
        <div class="ty-product-review-post-header__product-options">
            {include file="common/options_info.tpl" product_options=$product_review.product_options no_block=true}
        </div>
    {/if}

</header>
