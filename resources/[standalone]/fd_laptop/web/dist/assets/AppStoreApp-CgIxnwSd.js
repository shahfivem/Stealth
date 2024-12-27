const __vite__mapDeps=(i,m=__vite__mapDeps,d=(m.f||(m.f=["assets/AppComponent-B5oVz8D1.js","assets/index-CUz47RG4.js","assets/index-DfsOhq5G.css","assets/url.utils-DFDgd6Sa.js","assets/index--4L0djX4.js","assets/index-z7JxnMWN.js","assets/index-PFMSMQwc.js","assets/AppViewOverlayComponent-DyeVClmw.js","assets/index-D4TOqlB4.js","assets/index-kleVd9nI.js","assets/index-ClxhfF5V.js","assets/index-C_SN_bao.js","assets/index-Dh7OtMVJ.js"])))=>i.map(i=>d[i]);
import{B as z,o as i,c,q as C,m as V,E,a5 as L,H as R,I as T,a6 as v,b as D,a7 as j,l as A,N as a,x as J,a as u,v as g,n as x,w as U,F as W,A as q,P as $,_ as k,a8 as S}from"./index-CUz47RG4.js";import{s as B}from"./index-PFMSMQwc.js";import{s as H}from"./index-JPxqv-Dt.js";import"./index-C4xZGX4t.js";var M=function(p){var e=p.dt;return`
.p-iconfield {
    position: relative;
}

.p-inputicon {
    position: absolute;
    top: 50%;
    margin-top: calc(-1 * (`.concat(e("icon.size"),` / 2));
    color: `).concat(e("iconfield.icon.color"),`;
    line-height: 1;
}

.p-iconfield .p-inputicon:first-child {
    inset-inline-start: `).concat(e("form.field.padding.x"),`;
}

.p-iconfield .p-inputicon:last-child {
    inset-inline-end: `).concat(e("form.field.padding.x"),`;
}

.p-iconfield .p-inputtext:not(:first-child) {
    padding-inline-start: calc((`).concat(e("form.field.padding.x")," * 2) + ").concat(e("icon.size"),`);
}

.p-iconfield .p-inputtext:not(:last-child) {
    padding-inline-end: calc((`).concat(e("form.field.padding.x")," * 2) + ").concat(e("icon.size"),`);
}

.p-iconfield:has(.p-inputfield-sm) .p-inputicon {
    font-size: `).concat(e("form.field.sm.font.size"),`;
    width: `).concat(e("form.field.sm.font.size"),`;
    height: `).concat(e("form.field.sm.font.size"),`;
    margin-top: calc(-1 * (`).concat(e("form.field.sm.font.size"),` / 2));
}

.p-iconfield:has(.p-inputfield-lg) .p-inputicon {
    font-size: `).concat(e("form.field.lg.font.size"),`;
    width: `).concat(e("form.field.lg.font.size"),`;
    height: `).concat(e("form.field.lg.font.size"),`;
    margin-top: calc(-1 * (`).concat(e("form.field.lg.font.size"),` / 2));
}
`)},G={root:"p-iconfield"},K=z.extend({name:"iconfield",theme:M,classes:G}),Q={name:"BaseIconField",extends:B,style:K,provide:function(){return{$pcIconField:this,$parentInstance:this}}},F={name:"IconField",extends:Q,inheritAttrs:!1};function X(n,p,e,o,d,r){return i(),c("div",V({class:n.cx("root")},n.ptmi("root")),[C(n.$slots,"default")],16)}F.render=X;var Y={root:"p-inputicon"},Z=z.extend({name:"inputicon",classes:Y}),ee={name:"BaseInputIcon",extends:B,style:Z,props:{class:null},provide:function(){return{$pcInputIcon:this,$parentInstance:this}}},O={name:"InputIcon",extends:ee,inheritAttrs:!1,computed:{containerClass:function(){return[this.cx("root"),this.class]}}};function te(n,p,e,o,d,r){return i(),c("span",V({class:r.containerClass},n.ptmi("root")),[C(n.$slots,"default")],16)}O.render=te;const ne={class:"relative flex flex-1 select-none flex-col gap-4 bg-gray-100/50 p-4 dark:bg-gray-800/50"},oe={class:"flex h-10 items-center justify-between"},se={class:"text-3xl font-semibold"},ae={key:1,class:"grid flex-1 grid-cols-2 grid-rows-[repeat(3,min-content)_1fr] gap-3 overflow-auto scrollbar-thin scrollbar-track-rounded-[100px] scrollbar-thumb-rounded-[100px] scrollbar-corner-rounded-[100px] dark:scrollbar-track-gray-500/80 dark:scrollbar-thumb-gray-400/80"},ie={key:2,class:"flex flex-1 items-center justify-center"},le={class:"mt-3 text-2xl font-semibold text-gray-800 md:text-3xl dark:text-white"},re={class:"mt-4 text-gray-500 dark:text-gray-400"},fe=E({__name:"AppStoreApp",props:{metadata:{},appReady:{type:Function},changeWindowTitle:{type:Function}},setup(n){const p=$(()=>k(()=>import("./AppComponent-B5oVz8D1.js"),__vite__mapDeps([0,1,2,3,4,5,6]))),e=$(()=>k(()=>import("./AppViewOverlayComponent-DyeVClmw.js"),__vite__mapDeps([7,1,2,3,4,5,6,8,9,10,11,12]))),o=L(),d=R(),r=T(),y=n,m=v(!1),_=v(),N=t=>{_.value=t,m.value=!0},P=()=>{_.value=void 0,m.value=!1},f=v(),I=D(()=>f.value?d.appStoreApplications.filter(t=>{var s;return(s=t.name)==null?void 0:s.toLowerCase().includes(f.value.toLowerCase())}):d.appStoreApplications),w=async t=>{if(t.isInstalled)return;t.isInstalling=!0;const{data:s}=await S("installApp",{method:"POST",body:JSON.stringify({id:t.id})},void 0,{success:!0,error:void 0}),{success:l,error:h}=s.value;if(!l){t.isInstalling=!1,r.show({summary:o.t("app_store_unable_to_install"),detail:h||o.t("app_store_unable_to_install_helptext")});return}},b=async t=>{if(!t.isInstalled)return;t.isInstalling=!0;const{data:s}=await S("uninstallApp",{method:"POST",body:JSON.stringify({id:t.id})},void 0,{success:!0,error:void 0}),{success:l,error:h}=s.value;if(t.isInstalling=!1,!l){r.show({summary:o.t("app_store_unable_to_remove"),detail:h||o.t("app_store_unable_to_remove_helptext")});return}r.show({summary:o.t("app_store_uninstall_success"),detail:o.t("app_store_uninstall_success_helptext")}),d.markAsUninstalled(t.id)};return j(()=>{y.appReady(),y.changeWindowTitle(o.t("app_store_title"))}),(t,s)=>(i(),c("div",ne,[m.value?(i(),A(a(e),{key:0,app:_.value,onClose:P,onInstall:w,onRemove:b},null,8,["app"])):J("",!0),u("div",oe,[u("h2",se,g(a(o).t("app_store_title")),1),x(a(F),null,{default:U(()=>[x(a(O),{class:"pi pi-search"}),x(a(H),{modelValue:f.value,"onUpdate:modelValue":s[0]||(s[0]=l=>f.value=l),placeholder:"Search",type:"text",class:"rounded-full"},null,8,["modelValue"])]),_:1})]),I.value.length>0?(i(),c("div",ae,[(i(!0),c(W,null,q(I.value,l=>(i(),A(a(p),{app:l,onOpenView:N,onInstall:w,onRemove:b},null,8,["app"]))),256))])):(i(),c("div",ie,[u("div",null,[u("h1",le,g(a(o).t("app_store_nothing_here")),1),u("p",re,g(a(o).t("app_store_nothing_here_helptext")),1)])]))]))}});export{fe as default};
