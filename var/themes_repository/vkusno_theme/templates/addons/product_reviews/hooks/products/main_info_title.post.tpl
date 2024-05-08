{*
    $product
*}

{*{include file="addons/product_reviews/views/product_reviews/components/product_rating_overview_short.tpl"*}
{*    average_rating=$product.average_rating*}
{*    total_product_reviews=$product.product_reviews_count*}
{*    button=true}*}


{assign var="rating" value="rating_$obj_id"}
{if $smarty.capture.$rating}
    <div class="ty-product-block__rating">
        {*                                                {$smarty.capture.$rating nofilter}*}

        {if $product.average_rating}
            <p>{$product.average_rating|truncate:3:""}</p>
            <span class="vk-star"></span>
        {else}
            <p>0.0</p>
            <span class="vk-star"></span>
        {/if}
    </div>
{/if}
