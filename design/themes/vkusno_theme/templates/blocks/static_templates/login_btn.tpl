{** block-description:ip5_tmpl_login **}
{if !$auth.user_id}
    <div class="ip5_login_btn"><a href="{"auth.login_form"|fn_url}" rel="nofollow">{__("sign_in")}</a></div>
{/if}

