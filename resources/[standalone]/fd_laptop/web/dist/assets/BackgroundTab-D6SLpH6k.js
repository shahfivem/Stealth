import{B as $,o,c as i,m as x,E as z,G as C,a5 as N,I,a6 as p,a7 as R,a8 as S,ap as X,n,N as e,F as M,A as T,a4 as k,a as A,x as E,aq as F,ab as L}from"./index-CUz47RG4.js";import{b as V}from"./url.utils-DFDgd6Sa.js";import{s as B}from"./index--4L0djX4.js";import{s as q}from"./index-PFMSMQwc.js";import"./index-z7JxnMWN.js";const O=[{src:"1.jpg"},{src:"2.png"},{src:"3.jpg"},{src:"4.jpg"},{src:"5.jpg"},{src:"6.jpg"},{src:"7.jpg"},{src:"8.jpg"},{src:"9.jpg"},{src:"10.jpg"},{src:"11.jpg"}];var P=function(u){var t=u.dt;return`
.p-skeleton {
    overflow: hidden;
    background: `.concat(t("skeleton.background"),`;
    border-radius: `).concat(t("skeleton.border.radius"),`;
}

.p-skeleton::after {
    content: "";
    animation: p-skeleton-animation 1.2s infinite;
    height: 100%;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    transform: translateX(-100%);
    z-index: 1;
    background: linear-gradient(90deg, rgba(255, 255, 255, 0), `).concat(t("skeleton.animation.background"),`, rgba(255, 255, 255, 0));
}

[dir='rtl'] .p-skeleton::after {
    animation-name: p-skeleton-animation-rtl;
}

.p-skeleton-circle {
    border-radius: 50%;
}

.p-skeleton-animation-none::after {
    animation: none;
}

@keyframes p-skeleton-animation {
    from {
        transform: translateX(-100%);
    }
    to {
        transform: translateX(100%);
    }
}

@keyframes p-skeleton-animation-rtl {
    from {
        transform: translateX(100%);
    }
    to {
        transform: translateX(-100%);
    }
}
`)},U={root:{position:"relative"}},W={root:function(u){var t=u.props;return["p-skeleton p-component",{"p-skeleton-circle":t.shape==="circle","p-skeleton-animation-none":t.animation==="none"}]}},G=$.extend({name:"skeleton",theme:P,classes:W,inlineStyles:U}),J={name:"BaseSkeleton",extends:q,props:{shape:{type:String,default:"rectangle"},size:{type:String,default:null},width:{type:String,default:"100%"},height:{type:String,default:"1rem"},borderRadius:{type:String,default:null},animation:{type:String,default:"wave"}},style:G,provide:function(){return{$pcSkeleton:this,$parentInstance:this}}},s={name:"Skeleton",extends:J,inheritAttrs:!1,computed:{containerStyle:function(){return this.size?{width:this.size,height:this.size,borderRadius:this.borderRadius}:{width:this.width,height:this.height,borderRadius:this.borderRadius}}}};function D(r,u,t,d,m,h){return o(),i("div",x({class:r.cx("root"),style:[r.sx("root"),h.containerStyle],"aria-hidden":"true"},r.ptmi("root")),null,16)}s.render=D;const H={key:0,class:"lscrollbar mb-2 grid auto-rows-[9rem] grid-cols-3 gap-4"},K={key:1,class:"lscrollbar grid auto-rows-[9rem] grid-cols-3 gap-4 overflow-auto"},Q=["onClick"],Y={key:0,class:"absolute inset-0 border-4 border-blue-500"},Z={class:"absolute bottom-0 right-0 rounded-tl-lg bg-blue-500 pl-2 pr-1 pt-1"},ee={key:0,class:"flex items-center justify-between gap-2"},te={key:1,class:"pi pi-check text-xs"},ie=z({__name:"BackgroundTab",props:{metadata:{},changeWindowTitle:{type:Function}},setup(r){const u=r,t=C(),d=N(),m=I(),h=L("settings"),b=p(!0),f=p(!1),y=p([]),a=p();R(async()=>{u.changeWindowTitle(d.t("settings_background_title"));const{data:l}=await S("availableBackgrounds",{},void 0,O);l.value&&(y.value=l.value,b.value=!1)});const v=()=>{f.value||a.value&&_(a.value)},_=l=>{f.value||(a.value||(a.value=t.backgroundImage),a.value===l&&(a.value=void 0),t.changeBackground(l))},j=async()=>{if(f.value||!a.value)return;const{data:l}=await S("saveBackground",{method:"POST",body:JSON.stringify({background:t.backgroundImage})},void 0,{success:!0,error:void 0}),{success:c}=l.value;if(!c){m.show({summary:d.t("settings_background_saving_error_title"),detail:d.t("settings_background_saving_error_description")}),v();return}m.show({summary:d.t("settings_background_saving_success_title"),detail:d.t("settings_background_saving_success_description")}),h.emit("updated"),a.value=void 0};return X(()=>{v()}),(l,c)=>b.value?(o(),i("div",H,[n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"}),n(e(s),{height:"9rem"})])):(o(),i("div",K,[(o(!0),i(M,null,T(y.value,g=>(o(),i("div",{class:"after:content[''] after:height-[9rem] relative col-span-1 aspect-square overflow-hidden rounded-lg after:relative after:w-full hover:cursor-pointer",key:g.src,onClick:k(w=>_(g.src),["prevent"])},[e(t).backgroundImage===g.src?(o(),i("div",Y,[A("div",Z,[a.value?(o(),i("div",ee,[n(e(B),{icon:"pi pi-save",onClick:c[0]||(c[0]=k(w=>j(),["stop"])),size:"small"}),n(e(B),{icon:"pi pi-refresh",onClick:c[1]||(c[1]=k(w=>v(),["stop"])),severity:"secondary",size:"small"})])):(o(),i("i",te))])])):E("",!0),F(g.src,()=>(o(),i("img",{src:e(V)(g.src),alt:"",class:"h-full w-full object-cover"},null,8,["src"])),c,2)],8,Q))),128))]))}});export{ie as default};
