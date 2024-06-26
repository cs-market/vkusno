{assign var="image_size" value=$image_size|default:80}
{function name="feature_value"}
    {strip}
        {if $feature.features_hash && $feature.feature_type == "ProductFeatures::EXTENDED"|enum}
            <a href="{"categories.view?category_id=`$product.main_category`&features_hash=`$feature.features_hash`"|fn_url}">
        {/if}
        {if $feature.prefix}<span class="ty-features-list__item-prefix">{$feature.prefix}</span>{/if}
        {if $feature.feature_type == "ProductFeatures::DATE"|enum}
            {$feature.value_int|date_format:"`$settings.Appearance.date_format`"}
        {elseif $feature.feature_type == "ProductFeatures::MULTIPLE_CHECKBOX"|enum}
            {foreach from=$feature.variants item="fvariant" name="ffev"}
                {$fvariant.variant|default:$fvariant.value}{if !$smarty.foreach.ffev.last}, {/if}
            {/foreach}
        {elseif $feature.feature_type == "ProductFeatures::TEXT_SELECTBOX"|enum || $feature.feature_type == "ProductFeatures::NUMBER_SELECTBOX"|enum || $feature.feature_type == "ProductFeatures::EXTENDED"|enum}
            {$feature.variant|default:$feature.value}
        {elseif $feature.feature_type == "ProductFeatures::SINGLE_CHECKBOX"|enum}
            {$feature.description}
        {elseif $feature.feature_type == "ProductFeatures::NUMBER_FIELD"|enum}
            {$feature.value_int|floatval}
        {else}
            {$feature.value}
        {/if}
        {if $feature.suffix}<span class="ty-features-list__item-suffix">{$feature.suffix}</span>{/if}
        {if $feature.feature_type == "ProductFeatures::EXTENDED"|enum && $feature.features_hash}
            </a>
        {/if}
    {/strip}
{/function}

{if $features}
    {strip}
        {if !$no_container}<div class="ty-features-list">{/if}

            <div class="ty-features__name">
                <p>{__("energy_value_per")}</p>
            </div>

            {foreach from=$features name=features_list item=feature}
                {if $feature.feature_type == "ProductFeatures::DATE"|enum || $feature.feature_type == "ProductFeatures::NUMBER_FIELD"|enum || $feature.feature_type == "ProductFeatures::NUMBER_SELECTBOX"|enum}
                    {$feature.description nofilter}: 
                {/if}

                {if $feature_image && $feature.variants[$feature.variant_id].image_pairs}
                    {assign var="obj_id" value=$feature.variant_id}
                    <a href="{"categories.view?category_id=`$product.main_category`&features_hash=`$feature.features_hash`"|fn_url}">
                        {include file="common/image.tpl" image_width=$image_size images=$feature.variants[$feature.variant_id].image_pairs no_ids=true}
                    </a>
                {else}
                    <div class="ty-features-list__item">
                        <p class="ty-features-list__value">{feature_value feature=$feature}</p>
                        <p class="ty-features-list__name">{$feature.description}</p>
                    </div>
                {/if}
            {/foreach}
        {if !$no_container}</div>{/if}
    {/strip}
{/if}
