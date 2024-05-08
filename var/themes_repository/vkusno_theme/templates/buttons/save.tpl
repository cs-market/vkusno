{assign var="current_dispatch" value=fn_get_current_dispatch()}

{if $current_dispatch == 'profiles.update'}
	{include file="buttons/button.tpl" but_name=$but_name but_text=__("ip5_theme_addon.save") but_onclick=$but_onclick but_href=$but_href but_role=$but_role}
{else}
	{include file="buttons/button.tpl" but_name=$but_name but_text=__("save") but_onclick=$but_onclick but_href=$but_href but_role=$but_role}
{/if}