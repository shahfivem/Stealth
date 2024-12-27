import{B as d,Q as c,R as b,k as p,p as f,o as i,c as r,a as g,q as u,t as h,m as l,x as v,v as m}from"./index-CUz47RG4.js";import{s as k}from"./index-C4xZGX4t.js";var y=function(o){var t=o.dt;return`
.p-togglebutton {
    display: inline-flex;
    cursor: pointer;
    user-select: none;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    position: relative;
    color: `.concat(t("togglebutton.color"),`;
    background: `).concat(t("togglebutton.background"),`;
    border: 1px solid `).concat(t("togglebutton.border.color"),`;
    padding: `).concat(t("togglebutton.padding"),`;
    font-size: 1rem;
    font-family: inherit;
    font-feature-settings: inherit;
    transition: background `).concat(t("togglebutton.transition.duration"),", color ").concat(t("togglebutton.transition.duration"),", border-color ").concat(t("togglebutton.transition.duration"),`,
        outline-color `).concat(t("togglebutton.transition.duration"),", box-shadow ").concat(t("togglebutton.transition.duration"),`;
    border-radius: `).concat(t("togglebutton.border.radius"),`;
    outline-color: transparent;
    font-weight: `).concat(t("togglebutton.font.weight"),`;
}

.p-togglebutton-content {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: `).concat(t("togglebutton.gap"),`;
}

.p-togglebutton-label,
.p-togglebutton-icon {
    position: relative;
    transition: none;
}

.p-togglebutton::before {
    content: "";
    background: transparent;
    transition: background `).concat(t("togglebutton.transition.duration"),", color ").concat(t("togglebutton.transition.duration"),", border-color ").concat(t("togglebutton.transition.duration"),`,
            outline-color `).concat(t("togglebutton.transition.duration"),", box-shadow ").concat(t("togglebutton.transition.duration"),`;
    position: absolute;
    inset-inline-start: `).concat(t("togglebutton.content.left"),`;
    inset-block-start: `).concat(t("togglebutton.content.top"),`;
    width: calc(100% - calc(2 * `).concat(t("togglebutton.content.left"),`));
    height: calc(100% - calc(2 * `).concat(t("togglebutton.content.top"),`));
    border-radius: `).concat(t("togglebutton.border.radius"),`;
}

.p-togglebutton.p-togglebutton-checked::before {
    background: `).concat(t("togglebutton.content.checked.background"),`;
    box-shadow: `).concat(t("togglebutton.content.checked.shadow"),`;
}

.p-togglebutton:not(:disabled):not(.p-togglebutton-checked):hover {
    background: `).concat(t("togglebutton.hover.background"),`;
    color: `).concat(t("togglebutton.hover.color"),`;
}

.p-togglebutton.p-togglebutton-checked {
    background: `).concat(t("togglebutton.checked.background"),`;
    border-color: `).concat(t("togglebutton.checked.border.color"),`;
    color: `).concat(t("togglebutton.checked.color"),`;
}

.p-togglebutton:focus-visible {
    box-shadow: `).concat(t("togglebutton.focus.ring.shadow"),`;
    outline: `).concat(t("togglebutton.focus.ring.width")," ").concat(t("togglebutton.focus.ring.style")," ").concat(t("togglebutton.focus.ring.color"),`;
    outline-offset: `).concat(t("togglebutton.focus.ring.offset"),`;
}

.p-togglebutton.p-invalid {
    border-color: `).concat(t("togglebutton.invalid.border.color"),`;
}

.p-togglebutton:disabled {
    opacity: 1;
    cursor: default;
    background: `).concat(t("togglebutton.disabled.background"),`;
    border-color: `).concat(t("togglebutton.disabled.border.color"),`;
    color: `).concat(t("togglebutton.disabled.color"),`;
}

.p-togglebutton-icon {
    color: `).concat(t("togglebutton.icon.color"),`;
}

.p-togglebutton:not(:disabled):not(.p-togglebutton-checked):hover .p-togglebutton-icon {
    color: `).concat(t("togglebutton.icon.hover.color"),`;
}

.p-togglebutton.p-togglebutton-checked .p-togglebutton-icon {
    color: `).concat(t("togglebutton.icon.checked.color"),`;
}

.p-togglebutton:disabled .p-togglebutton-icon {
    color: `).concat(t("togglebutton.icon.disabled.color"),`;
}

.p-togglebutton-sm {
    padding: `).concat(t("togglebutton.sm.padding"),`;
    font-size: `).concat(t("togglebutton.sm.font.size"),`;
}

.p-togglebutton-lg {
    padding: `).concat(t("togglebutton.lg.padding"),`;
    font-size: `).concat(t("togglebutton.lg.font.size"),`;
}
`)},B={root:function(o){var t=o.instance,a=o.props;return["p-togglebutton p-component",{"p-togglebutton-checked":t.active,"p-invalid":t.$invalid,"p-togglebutton-sm p-inputfield-sm":a.size==="small","p-togglebutton-lg p-inputfield-lg":a.size==="large"}]},content:"p-togglebutton-content",icon:"p-togglebutton-icon",label:"p-togglebutton-label"},w=d.extend({name:"togglebutton",theme:y,classes:B}),L={name:"BaseToggleButton",extends:k,props:{onIcon:String,offIcon:String,onLabel:{type:String,default:"Yes"},offLabel:{type:String,default:"No"},iconPos:{type:String,default:"left"},readonly:{type:Boolean,default:!1},tabindex:{type:Number,default:null},ariaLabelledby:{type:String,default:null},ariaLabel:{type:String,default:null},size:{type:String,default:null}},style:w,provide:function(){return{$pcToggleButton:this,$parentInstance:this}}},S={name:"ToggleButton",extends:L,inheritAttrs:!1,emits:["change"],methods:{getPTOptions:function(o){var t=o==="root"?this.ptmi:this.ptm;return t(o,{context:{active:this.active,disabled:this.disabled}})},onChange:function(o){!this.disabled&&!this.readonly&&(this.writeValue(!this.d_value,o),this.$emit("change",o))},onBlur:function(o){var t,a;(t=(a=this.formField).onBlur)===null||t===void 0||t.call(a,o)}},computed:{active:function(){return this.d_value===!0},hasLabel:function(){return c(this.onLabel)&&c(this.offLabel)},label:function(){return this.hasLabel?this.d_value?this.onLabel:this.offLabel:"&nbsp;"}},directives:{ripple:b}},T=["tabindex","disabled","aria-pressed","aria-labelledby","data-p-checked","data-p-disabled"];function z(n,o,t,a,P,e){var s=p("ripple");return f((i(),r("button",l({type:"button",class:n.cx("root"),tabindex:n.tabindex,disabled:n.disabled,"aria-pressed":n.d_value,onClick:o[0]||(o[0]=function(){return e.onChange&&e.onChange.apply(e,arguments)}),onBlur:o[1]||(o[1]=function(){return e.onBlur&&e.onBlur.apply(e,arguments)})},e.getPTOptions("root"),{"aria-labelledby":n.ariaLabelledby,"data-p-checked":e.active,"data-p-disabled":n.disabled}),[g("span",l({class:n.cx("content")},e.getPTOptions("content")),[u(n.$slots,"default",{},function(){return[u(n.$slots,"icon",{value:n.d_value,class:h(n.cx("icon"))},function(){return[n.onIcon||n.offIcon?(i(),r("span",l({key:0,class:[n.cx("icon"),n.d_value?n.onIcon:n.offIcon]},e.getPTOptions("icon")),null,16)):v("",!0)]}),g("span",l({class:n.cx("label")},e.getPTOptions("label")),m(e.label),17)]})],16)],16,T)),[[s]])}S.render=z;export{S as s};
