/**
 * HideTree
 *
 * Hide Evo Resources Tree
 * @author      Nicola1971
 * @category    plugin
 * @version     1.0
 * @license	    http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnManagerTreePrerender
 * @internal    @installset base
 * @internal    @modx_category Manager
 * @internal    @properties @properties &HideTo=Hide Resources Tree to:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;All &ThisRole=Hide only to this role:;string;;;(role id) &ThisUser=Hide only to this user:;string;;;(username)
 */
// get manager role
$internalKey = $modx->getLoginUserID();
$sid = $modx->sid;
$role = $_SESSION['mgrRole'];
$user = $_SESSION['mgrShortname'];
// hide only to Admin role 1
if(($role!=1) AND ($HideTo == 'AdminOnly')) {}
// hide to all manager users excluded Admin role 1
else if(($role==1) AND ($HideTo == 'AdminExcluded')) {}
// hide only to "this" role id
else if(($role!=$ThisRole) AND ($HideTo == 'ThisRoleOnly')) {}
// hide only to "this" username
else if(($user!=$ThisUser) AND ($HideTo == 'ThisUserOnly')) {}
else {
$e = &$modx->event;
switch($e->name){
case "OnManagerTreePrerender":
$out = "
<script>
jQuery(document).ready(function($) {
modx.resizer.setWidth(0); 
});
</script>
<style>
#resizer, #bars {display:none!important;}
@media (min-width: 840px) {
#site {margin-left:1em;}
}
</style>";
$modx->event->output($out);
break;
}
}