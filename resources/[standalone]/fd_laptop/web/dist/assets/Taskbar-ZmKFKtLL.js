const __vite__mapDeps=(i,m=__vite__mapDeps,d=(m.f||(m.f=["assets/StartMenu-BK16MNdP.js","assets/index-CUz47RG4.js","assets/index-DfsOhq5G.css","assets/ActiveApps-Bv7JO9GW.js","assets/TaskbarBlock-ClcBdyyQ.js"])))=>i.map(i=>d[i]);
import{B as f,o as a,c as l,m as v,q as b,x as g,E as y,n as i,N as r,P as o,_ as d}from"./index-CUz47RG4.js";import{s as h}from"./index-PFMSMQwc.js";var m=function(t){var e=t.dt;return`
.p-divider-horizontal {
    display: flex;
    width: 100%;
    position: relative;
    align-items: center;
    margin: `.concat(e("divider.horizontal.margin"),`;
    padding: `).concat(e("divider.horizontal.padding"),`;
}

.p-divider-horizontal:before {
    position: absolute;
    display: block;
    inset-block-start: 50%;
    inset-inline-start: 0;
    width: 100%;
    content: "";
    border-block-start: 1px solid `).concat(e("divider.border.color"),`;
}

.p-divider-horizontal .p-divider-content {
    padding: `).concat(e("divider.horizontal.content.padding"),`;
}

.p-divider-vertical {
    min-height: 100%;
    display: flex;
    position: relative;
    justify-content: center;
    margin: `).concat(e("divider.vertical.margin"),`;
    padding: `).concat(e("divider.vertical.padding"),`;
}

.p-divider-vertical:before {
    position: absolute;
    display: block;
    inset-block-start: 0;
    inset-inline-start: 50%;
    height: 100%;
    content: "";
    border-inline-start: 1px solid `).concat(e("divider.border.color"),`;
}

.p-divider.p-divider-vertical .p-divider-content {
    padding: `).concat(e("divider.vertical.content.padding"),`;
}

.p-divider-content {
    z-index: 1;
    background: `).concat(e("divider.content.background"),`;
    color: `).concat(e("divider.content.color"),`;
}

.p-divider-solid.p-divider-horizontal:before {
    border-block-start-style: solid;
}

.p-divider-solid.p-divider-vertical:before {
    border-inline-start-style: solid;
}

.p-divider-dashed.p-divider-horizontal:before {
    border-block-start-style: dashed;
}

.p-divider-dashed.p-divider-vertical:before {
    border-inline-start-style: dashed;
}

.p-divider-dotted.p-divider-horizontal:before {
    border-block-start-style: dotted;
}

.p-divider-dotted.p-divider-vertical:before {
    border-inline-start-style: dotted;
}

.p-divider-left:dir(rtl),
.p-divider-right:dir(rtl) {
    flex-direction: row-reverse;
}
`)},_={root:function(t){var e=t.props;return{justifyContent:e.layout==="horizontal"?e.align==="center"||e.align===null?"center":e.align==="left"?"flex-start":e.align==="right"?"flex-end":null:null,alignItems:e.layout==="vertical"?e.align==="center"||e.align===null?"center":e.align==="top"?"flex-start":e.align==="bottom"?"flex-end":null:null}}},k={root:function(t){var e=t.props;return["p-divider p-component","p-divider-"+e.layout,"p-divider-"+e.type,{"p-divider-left":e.layout==="horizontal"&&(!e.align||e.align==="left")},{"p-divider-center":e.layout==="horizontal"&&e.align==="center"},{"p-divider-right":e.layout==="horizontal"&&e.align==="right"},{"p-divider-top":e.layout==="vertical"&&e.align==="top"},{"p-divider-center":e.layout==="vertical"&&(!e.align||e.align==="center")},{"p-divider-bottom":e.layout==="vertical"&&e.align==="bottom"}]},content:"p-divider-content"},x=f.extend({name:"divider",theme:m,classes:k,inlineStyles:_}),z={name:"BaseDivider",extends:h,props:{align:{type:String,default:null},layout:{type:String,default:"horizontal"},type:{type:String,default:"solid"}},style:x,provide:function(){return{$pcDivider:this,$parentInstance:this}}},s={name:"Divider",extends:z,inheritAttrs:!1},$=["aria-orientation"];function S(n,t,e,p,c,u){return a(),l("div",v({class:n.cx("root"),style:n.sx("root"),role:"separator","aria-orientation":n.layout},n.ptmi("root")),[n.$slots.default?(a(),l("div",v({key:0,class:n.cx("content")},n.ptm("content")),[b(n.$slots,"default")],16)):g("",!0)],16,$)}s.render=S;const E={id:"start-menu",class:"fixed inset-x-0 bottom-3 z-50 mx-5 flex h-14 flex-none select-none px-2 before:absolute before:inset-0 before:z-0 before:rounded-lg before:bg-gray-100/50 before:backdrop-blur-sm before:dark:bg-gray-800/50"},B=y({__name:"Taskbar",props:{parent:{}},setup(n){const t=o(()=>d(()=>import("./StartMenu-BK16MNdP.js"),__vite__mapDeps([0,1,2]))),e=o(()=>d(()=>import("./ActiveApps-Bv7JO9GW.js"),__vite__mapDeps([3,1,2]))),p=o(()=>d(()=>import("./TaskbarBlock-ClcBdyyQ.js"),__vite__mapDeps([4,1,2])));return(c,u)=>(a(),l("div",E,[i(r(t),{parent:c.parent},null,8,["parent"]),i(r(s),{layout:"vertical"}),i(r(e)),i(r(s),{layout:"vertical"}),i(r(p))]))}});export{B as default};
