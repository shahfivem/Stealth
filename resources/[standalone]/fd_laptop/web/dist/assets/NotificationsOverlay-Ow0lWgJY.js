import{B as O,o as i,c as m,a as n,m as c,R as P,k as G,l as y,y as k,F as x,v as b,b2 as H,p as L,x as D,b3 as h,b4 as U,U as F,r as X,n as C,w as A,b5 as q,I as j,A as R,E as Y,a5 as J,H as K,a6 as Q,aT as W,b as ee,M,N as d,aR as _,a4 as v,b6 as te}from"./index-CUz47RG4.js";import{s as V}from"./index-PFMSMQwc.js";import{s as I}from"./index-z7JxnMWN.js";import{s as oe}from"./index-ClxhfF5V.js";import{s as w}from"./index--4L0djX4.js";function se(e){return typeof HTMLElement=="object"?e instanceof HTMLElement:e&&typeof e=="object"&&e!==null&&e.nodeType===1&&typeof e.nodeName=="string"}function ae(e,o="",t){se(e)&&t!==null&&t!==void 0&&e.setAttribute(o,t)}function ne(e){return e==null||e===""||Array.isArray(e)&&e.length===0||!(e instanceof Date)&&typeof e=="object"&&Object.keys(e).length===0}function re(){let e=[];const o=(s,l,p=999)=>{const $=r(s,l,p),g=$.value+($.key===s?0:p)+1;return e.push({key:s,value:g}),g},t=s=>{e=e.filter(l=>l.value!==s)},u=(s,l)=>r(s).value,r=(s,l,p=0)=>[...e].reverse().find($=>!0)||{key:s,value:p},a=s=>s&&parseInt(s.style.zIndex,10)||0;return{get:a,set:(s,l,p)=>{l&&(l.style.zIndex=String(o(s,!0,p)))},clear:s=>{s&&(t(a(s)),s.style.zIndex="")},getCurrent:s=>u(s)}}var S=re();const ie=({dt:e})=>`
.p-toast {
    width: ${e("toast.width")};
    white-space: pre-line;
    word-break: break-word;
}

.p-toast-message {
    margin: 0 0 1rem 0;
}

.p-toast-message-icon {
    flex-shrink: 0;
    font-size: ${e("toast.icon.size")};
    width: ${e("toast.icon.size")};
    height: ${e("toast.icon.size")};
}

.p-toast-message-content {
    display: flex;
    align-items: flex-start;
    padding: ${e("toast.content.padding")};
    gap: ${e("toast.content.gap")};
}

.p-toast-message-text {
    flex: 1 1 auto;
    display: flex;
    flex-direction: column;
    gap: ${e("toast.text.gap")};
}

.p-toast-summary {
    font-weight: ${e("toast.summary.font.weight")};
    font-size: ${e("toast.summary.font.size")};
}

.p-toast-detail {
    font-weight: ${e("toast.detail.font.weight")};
    font-size: ${e("toast.detail.font.size")};
}

.p-toast-close-button {
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    position: relative;
    cursor: pointer;
    background: transparent;
    transition: background ${e("toast.transition.duration")}, color ${e("toast.transition.duration")}, outline-color ${e("toast.transition.duration")}, box-shadow ${e("toast.transition.duration")};
    outline-color: transparent;
    color: inherit;
    width: ${e("toast.close.button.width")};
    height: ${e("toast.close.button.height")};
    border-radius: ${e("toast.close.button.border.radius")};
    margin: -25% 0 0 0;
    right: -25%;
    padding: 0;
    border: none;
    user-select: none;
}

.p-toast-message-info,
.p-toast-message-success,
.p-toast-message-warn,
.p-toast-message-error,
.p-toast-message-secondary,
.p-toast-message-contrast {
    border-width: ${e("toast.border.width")};
    border-style: solid;
    backdrop-filter: blur(${e("toast.blur")});
    border-radius: ${e("toast.border.radius")};
}

.p-toast-close-icon {
    font-size: ${e("toast.close.icon.size")};
    width: ${e("toast.close.icon.size")};
    height: ${e("toast.close.icon.size")};
}

.p-toast-close-button:focus-visible {
    outline-width: ${e("focus.ring.width")};
    outline-style: ${e("focus.ring.style")};
    outline-offset: ${e("focus.ring.offset")};
}

.p-toast-message-info {
    background: ${e("toast.info.background")};
    border-color: ${e("toast.info.border.color")};
    color: ${e("toast.info.color")};
    box-shadow: ${e("toast.info.shadow")};
}

.p-toast-message-info .p-toast-detail {
    color: ${e("toast.info.detail.color")};
}

.p-toast-message-info .p-toast-close-button:focus-visible {
    outline-color: ${e("toast.info.close.button.focus.ring.color")};
    box-shadow: ${e("toast.info.close.button.focus.ring.shadow")};
}

.p-toast-message-info .p-toast-close-button:hover {
    background: ${e("toast.info.close.button.hover.background")};
}

.p-toast-message-success {
    background: ${e("toast.success.background")};
    border-color: ${e("toast.success.border.color")};
    color: ${e("toast.success.color")};
    box-shadow: ${e("toast.success.shadow")};
}

.p-toast-message-success .p-toast-detail {
    color: ${e("toast.success.detail.color")};
}

.p-toast-message-success .p-toast-close-button:focus-visible {
    outline-color: ${e("toast.success.close.button.focus.ring.color")};
    box-shadow: ${e("toast.success.close.button.focus.ring.shadow")};
}

.p-toast-message-success .p-toast-close-button:hover {
    background: ${e("toast.success.close.button.hover.background")};
}

.p-toast-message-warn {
    background: ${e("toast.warn.background")};
    border-color: ${e("toast.warn.border.color")};
    color: ${e("toast.warn.color")};
    box-shadow: ${e("toast.warn.shadow")};
}

.p-toast-message-warn .p-toast-detail {
    color: ${e("toast.warn.detail.color")};
}

.p-toast-message-warn .p-toast-close-button:focus-visible {
    outline-color: ${e("toast.warn.close.button.focus.ring.color")};
    box-shadow: ${e("toast.warn.close.button.focus.ring.shadow")};
}

.p-toast-message-warn .p-toast-close-button:hover {
    background: ${e("toast.warn.close.button.hover.background")};
}

.p-toast-message-error {
    background: ${e("toast.error.background")};
    border-color: ${e("toast.error.border.color")};
    color: ${e("toast.error.color")};
    box-shadow: ${e("toast.error.shadow")};
}

.p-toast-message-error .p-toast-detail {
    color: ${e("toast.error.detail.color")};
}

.p-toast-message-error .p-toast-close-button:focus-visible {
    outline-color: ${e("toast.error.close.button.focus.ring.color")};
    box-shadow: ${e("toast.error.close.button.focus.ring.shadow")};
}

.p-toast-message-error .p-toast-close-button:hover {
    background: ${e("toast.error.close.button.hover.background")};
}

.p-toast-message-secondary {
    background: ${e("toast.secondary.background")};
    border-color: ${e("toast.secondary.border.color")};
    color: ${e("toast.secondary.color")};
    box-shadow: ${e("toast.secondary.shadow")};
}

.p-toast-message-secondary .p-toast-detail {
    color: ${e("toast.secondary.detail.color")};
}

.p-toast-message-secondary .p-toast-close-button:focus-visible {
    outline-color: ${e("toast.secondary.close.button.focus.ring.color")};
    box-shadow: ${e("toast.secondary.close.button.focus.ring.shadow")};
}

.p-toast-message-secondary .p-toast-close-button:hover {
    background: ${e("toast.secondary.close.button.hover.background")};
}

.p-toast-message-contrast {
    background: ${e("toast.contrast.background")};
    border-color: ${e("toast.contrast.border.color")};
    color: ${e("toast.contrast.color")};
    box-shadow: ${e("toast.contrast.shadow")};
}

.p-toast-message-contrast .p-toast-detail {
    color: ${e("toast.contrast.detail.color")};
}

.p-toast-message-contrast .p-toast-close-button:focus-visible {
    outline-color: ${e("toast.contrast.close.button.focus.ring.color")};
    box-shadow: ${e("toast.contrast.close.button.focus.ring.shadow")};
}

.p-toast-message-contrast .p-toast-close-button:hover {
    background: ${e("toast.contrast.close.button.hover.background")};
}

.p-toast-top-center {
    transform: translateX(-50%);
}

.p-toast-bottom-center {
    transform: translateX(-50%);
}

.p-toast-center {
    min-width: 20vw;
    transform: translate(-50%, -50%);
}

.p-toast-message-enter-from {
    opacity: 0;
    transform: translateY(50%);
}

.p-toast-message-leave-from {
    max-height: 1000px;
}

.p-toast .p-toast-message.p-toast-message-leave-to {
    max-height: 0;
    opacity: 0;
    margin-bottom: 0;
    overflow: hidden;
}

.p-toast-message-enter-active {
    transition: transform 0.3s, opacity 0.3s;
}

.p-toast-message-leave-active {
    transition: max-height 0.45s cubic-bezier(0, 1, 0, 1), opacity 0.3s, margin-bottom 0.3s;
}
`,le={root:({position:e})=>({position:"fixed",top:e==="top-right"||e==="top-left"||e==="top-center"?"20px":e==="center"?"50%":null,right:(e==="top-right"||e==="bottom-right")&&"20px",bottom:(e==="bottom-left"||e==="bottom-right"||e==="bottom-center")&&"100px",left:e==="top-left"||e==="bottom-left"?"20px":e==="center"||e==="top-center"||e==="bottom-center"?"50%":null})},ce={root:({props:e})=>["p-toast p-component p-toast-"+e.position],message:({props:e})=>["p-toast-message",{"p-toast-message-info":e.message.severity==="info"||e.message.severity===void 0,"p-toast-message-warn":e.message.severity==="warn","p-toast-message-error":e.message.severity==="error","p-toast-message-success":e.message.severity==="success","p-toast-message-secondary":e.message.severity==="secondary","p-toast-message-contrast":e.message.severity==="contrast"}],messageContent:"p-toast-message-content",messageIcon:({props:e})=>["p-toast-message-icon",{[e.infoIcon]:e.message.severity==="info",[e.warnIcon]:e.message.severity==="warn",[e.errorIcon]:e.message.severity==="error",[e.successIcon]:e.message.severity==="success"}],messageText:"p-toast-message-text",summary:"p-toast-summary",detail:"p-toast-detail",closeButton:"p-toast-close-button",closeIcon:"p-toast-close-icon"},ue=O.extend({name:"toast",theme:ie,classes:ce,inlineStyles:le}),me={name:"BaseToast",extends:V,props:{group:{type:String,default:null},position:{type:String,default:"top-right"},autoZIndex:{type:Boolean,default:!0},baseZIndex:{type:Number,default:0},breakpoints:{type:Object,default:null},closeIcon:{type:String,default:void 0},infoIcon:{type:String,default:void 0},warnIcon:{type:String,default:void 0},errorIcon:{type:String,default:void 0},successIcon:{type:String,default:void 0},closeButtonProps:{type:null,default:null},to:{type:String,default:null}},style:ue,provide(){return{$pcToast:this,$parentInstance:this}}};var Z={name:"CheckIcon",extends:I};function de(e,o,t,u,r,a){return i(),m("svg",c({width:"14",height:"14",viewBox:"0 0 14 14",fill:"none",xmlns:"http://www.w3.org/2000/svg"},e.pti()),o[0]||(o[0]=[n("path",{d:"M4.86199 11.5948C4.78717 11.5923 4.71366 11.5745 4.64596 11.5426C4.57826 11.5107 4.51779 11.4652 4.46827 11.4091L0.753985 7.69483C0.683167 7.64891 0.623706 7.58751 0.580092 7.51525C0.536478 7.44299 0.509851 7.36177 0.502221 7.27771C0.49459 7.19366 0.506156 7.10897 0.536046 7.03004C0.565935 6.95111 0.613367 6.88 0.674759 6.82208C0.736151 6.76416 0.8099 6.72095 0.890436 6.69571C0.970973 6.67046 1.05619 6.66385 1.13966 6.67635C1.22313 6.68886 1.30266 6.72017 1.37226 6.76792C1.44186 6.81567 1.4997 6.8786 1.54141 6.95197L4.86199 10.2503L12.6397 2.49483C12.7444 2.42694 12.8689 2.39617 12.9932 2.40745C13.1174 2.41873 13.2343 2.47141 13.3251 2.55705C13.4159 2.64268 13.4753 2.75632 13.4938 2.87973C13.5123 3.00315 13.4888 3.1292 13.4271 3.23768L5.2557 11.4091C5.20618 11.4652 5.14571 11.5107 5.07801 11.5426C5.01031 11.5745 4.9368 11.5923 4.86199 11.5948Z",fill:"currentColor"},null,-1)]),16)}Z.render=de;var B={name:"ExclamationTriangleIcon",extends:I};function pe(e,o,t,u,r,a){return i(),m("svg",c({width:"14",height:"14",viewBox:"0 0 14 14",fill:"none",xmlns:"http://www.w3.org/2000/svg"},e.pti()),o[0]||(o[0]=[n("path",{d:"M13.4018 13.1893H0.598161C0.49329 13.189 0.390283 13.1615 0.299143 13.1097C0.208003 13.0578 0.131826 12.9832 0.0780112 12.8932C0.0268539 12.8015 0 12.6982 0 12.5931C0 12.4881 0.0268539 12.3848 0.0780112 12.293L6.47985 1.08982C6.53679 1.00399 6.61408 0.933574 6.70484 0.884867C6.7956 0.836159 6.897 0.810669 7 0.810669C7.103 0.810669 7.2044 0.836159 7.29516 0.884867C7.38592 0.933574 7.46321 1.00399 7.52015 1.08982L13.922 12.293C13.9731 12.3848 14 12.4881 14 12.5931C14 12.6982 13.9731 12.8015 13.922 12.8932C13.8682 12.9832 13.792 13.0578 13.7009 13.1097C13.6097 13.1615 13.5067 13.189 13.4018 13.1893ZM1.63046 11.989H12.3695L7 2.59425L1.63046 11.989Z",fill:"currentColor"},null,-1),n("path",{d:"M6.99996 8.78801C6.84143 8.78594 6.68997 8.72204 6.57787 8.60993C6.46576 8.49782 6.40186 8.34637 6.39979 8.18784V5.38703C6.39979 5.22786 6.46302 5.0752 6.57557 4.96265C6.68813 4.85009 6.84078 4.78686 6.99996 4.78686C7.15914 4.78686 7.31179 4.85009 7.42435 4.96265C7.5369 5.0752 7.60013 5.22786 7.60013 5.38703V8.18784C7.59806 8.34637 7.53416 8.49782 7.42205 8.60993C7.30995 8.72204 7.15849 8.78594 6.99996 8.78801Z",fill:"currentColor"},null,-1),n("path",{d:"M6.99996 11.1887C6.84143 11.1866 6.68997 11.1227 6.57787 11.0106C6.46576 10.8985 6.40186 10.7471 6.39979 10.5885V10.1884C6.39979 10.0292 6.46302 9.87658 6.57557 9.76403C6.68813 9.65147 6.84078 9.58824 6.99996 9.58824C7.15914 9.58824 7.31179 9.65147 7.42435 9.76403C7.5369 9.87658 7.60013 10.0292 7.60013 10.1884V10.5885C7.59806 10.7471 7.53416 10.8985 7.42205 11.0106C7.30995 11.1227 7.15849 11.1866 6.99996 11.1887Z",fill:"currentColor"},null,-1)]),16)}B.render=pe;var z={name:"InfoCircleIcon",extends:I};function ge(e,o,t,u,r,a){return i(),m("svg",c({width:"14",height:"14",viewBox:"0 0 14 14",fill:"none",xmlns:"http://www.w3.org/2000/svg"},e.pti()),o[0]||(o[0]=[n("path",{"fill-rule":"evenodd","clip-rule":"evenodd",d:"M3.11101 12.8203C4.26215 13.5895 5.61553 14 7 14C8.85652 14 10.637 13.2625 11.9497 11.9497C13.2625 10.637 14 8.85652 14 7C14 5.61553 13.5895 4.26215 12.8203 3.11101C12.0511 1.95987 10.9579 1.06266 9.67879 0.532846C8.3997 0.00303296 6.99224 -0.13559 5.63437 0.134506C4.2765 0.404603 3.02922 1.07129 2.05026 2.05026C1.07129 3.02922 0.404603 4.2765 0.134506 5.63437C-0.13559 6.99224 0.00303296 8.3997 0.532846 9.67879C1.06266 10.9579 1.95987 12.0511 3.11101 12.8203ZM3.75918 2.14976C4.71846 1.50879 5.84628 1.16667 7 1.16667C8.5471 1.16667 10.0308 1.78125 11.1248 2.87521C12.2188 3.96918 12.8333 5.45291 12.8333 7C12.8333 8.15373 12.4912 9.28154 11.8502 10.2408C11.2093 11.2001 10.2982 11.9478 9.23232 12.3893C8.16642 12.8308 6.99353 12.9463 5.86198 12.7212C4.73042 12.4962 3.69102 11.9406 2.87521 11.1248C2.05941 10.309 1.50384 9.26958 1.27876 8.13803C1.05367 7.00647 1.16919 5.83358 1.61071 4.76768C2.05222 3.70178 2.79989 2.79074 3.75918 2.14976ZM7.00002 4.8611C6.84594 4.85908 6.69873 4.79698 6.58977 4.68801C6.48081 4.57905 6.4187 4.43185 6.41669 4.27776V3.88888C6.41669 3.73417 6.47815 3.58579 6.58754 3.4764C6.69694 3.367 6.84531 3.30554 7.00002 3.30554C7.15473 3.30554 7.3031 3.367 7.4125 3.4764C7.52189 3.58579 7.58335 3.73417 7.58335 3.88888V4.27776C7.58134 4.43185 7.51923 4.57905 7.41027 4.68801C7.30131 4.79698 7.1541 4.85908 7.00002 4.8611ZM7.00002 10.6945C6.84594 10.6925 6.69873 10.6304 6.58977 10.5214C6.48081 10.4124 6.4187 10.2652 6.41669 10.1111V6.22225C6.41669 6.06754 6.47815 5.91917 6.58754 5.80977C6.69694 5.70037 6.84531 5.63892 7.00002 5.63892C7.15473 5.63892 7.3031 5.70037 7.4125 5.80977C7.52189 5.91917 7.58335 6.06754 7.58335 6.22225V10.1111C7.58134 10.2652 7.51923 10.4124 7.41027 10.5214C7.30131 10.6304 7.1541 10.6925 7.00002 10.6945Z",fill:"currentColor"},null,-1)]),16)}z.render=ge;var E={name:"TimesCircleIcon",extends:I};function fe(e,o,t,u,r,a){return i(),m("svg",c({width:"14",height:"14",viewBox:"0 0 14 14",fill:"none",xmlns:"http://www.w3.org/2000/svg"},e.pti()),o[0]||(o[0]=[n("path",{"fill-rule":"evenodd","clip-rule":"evenodd",d:"M7 14C5.61553 14 4.26215 13.5895 3.11101 12.8203C1.95987 12.0511 1.06266 10.9579 0.532846 9.67879C0.00303296 8.3997 -0.13559 6.99224 0.134506 5.63437C0.404603 4.2765 1.07129 3.02922 2.05026 2.05026C3.02922 1.07129 4.2765 0.404603 5.63437 0.134506C6.99224 -0.13559 8.3997 0.00303296 9.67879 0.532846C10.9579 1.06266 12.0511 1.95987 12.8203 3.11101C13.5895 4.26215 14 5.61553 14 7C14 8.85652 13.2625 10.637 11.9497 11.9497C10.637 13.2625 8.85652 14 7 14ZM7 1.16667C5.84628 1.16667 4.71846 1.50879 3.75918 2.14976C2.79989 2.79074 2.05222 3.70178 1.61071 4.76768C1.16919 5.83358 1.05367 7.00647 1.27876 8.13803C1.50384 9.26958 2.05941 10.309 2.87521 11.1248C3.69102 11.9406 4.73042 12.4962 5.86198 12.7212C6.99353 12.9463 8.16642 12.8308 9.23232 12.3893C10.2982 11.9478 11.2093 11.2001 11.8502 10.2408C12.4912 9.28154 12.8333 8.15373 12.8333 7C12.8333 5.45291 12.2188 3.96918 11.1248 2.87521C10.0308 1.78125 8.5471 1.16667 7 1.16667ZM4.66662 9.91668C4.58998 9.91704 4.51404 9.90209 4.44325 9.87271C4.37246 9.84333 4.30826 9.8001 4.2544 9.74557C4.14516 9.6362 4.0838 9.48793 4.0838 9.33335C4.0838 9.17876 4.14516 9.0305 4.2544 8.92113L6.17553 7L4.25443 5.07891C4.15139 4.96832 4.09529 4.82207 4.09796 4.67094C4.10063 4.51982 4.16185 4.37563 4.26872 4.26876C4.3756 4.16188 4.51979 4.10066 4.67091 4.09799C4.82204 4.09532 4.96829 4.15142 5.07887 4.25446L6.99997 6.17556L8.92106 4.25446C9.03164 4.15142 9.1779 4.09532 9.32903 4.09799C9.48015 4.10066 9.62434 4.16188 9.73121 4.26876C9.83809 4.37563 9.89931 4.51982 9.90198 4.67094C9.90464 4.82207 9.84855 4.96832 9.74551 5.07891L7.82441 7L9.74554 8.92113C9.85478 9.0305 9.91614 9.17876 9.91614 9.33335C9.91614 9.48793 9.85478 9.6362 9.74554 9.74557C9.69168 9.8001 9.62748 9.84333 9.55669 9.87271C9.4859 9.90209 9.40996 9.91704 9.33332 9.91668C9.25668 9.91704 9.18073 9.90209 9.10995 9.87271C9.03916 9.84333 8.97495 9.8001 8.9211 9.74557L6.99997 7.82444L5.07884 9.74557C5.02499 9.8001 4.96078 9.84333 4.88999 9.87271C4.81921 9.90209 4.74326 9.91704 4.66662 9.91668Z",fill:"currentColor"},null,-1)]),16)}E.render=fe;const N=(e,o)=>{const t=e.__vccOpts||e;for(const[u,r]of o)t[u]=r;return t},he={name:"ToastMessage",hostName:"Toast",extends:V,emits:["close"],closeTimeout:null,props:{message:{type:null,default:null},templates:{type:Object,default:null},closeIcon:{type:String,default:null},infoIcon:{type:String,default:null},warnIcon:{type:String,default:null},errorIcon:{type:String,default:null},successIcon:{type:String,default:null},closeButtonProps:{type:null,default:null}},mounted(){this.message.life&&(this.closeTimeout=setTimeout(()=>{this.close({message:this.message,type:"life-end"})},this.message.life))},beforeUnmount(){this.clearCloseTimeout()},methods:{close(e){this.$emit("close",e)},onCloseClick(){this.clearCloseTimeout(),this.close({message:this.message,type:"close"})},clearCloseTimeout(){this.closeTimeout&&(clearTimeout(this.closeTimeout),this.closeTimeout=null)}},computed:{iconComponent(){return{info:!this.infoIcon&&z,success:!this.successIcon&&Z,warn:!this.warnIcon&&B,error:!this.errorIcon&&E}[this.message.severity]},closeAriaLabel(){return this.$primevue.config.locale.aria?this.$primevue.config.locale.aria.close:void 0}},components:{TimesIcon:oe,InfoCircleIcon:z,CheckIcon:Z,ExclamationTriangleIcon:B,TimesCircleIcon:E},directives:{ripple:P}},be=["aria-label"];function Ce(e,o,t,u,r,a){const s=G("ripple");return i(),m("div",c({class:[e.cx("message"),t.message.styleClass],role:"alert","aria-live":"assertive","aria-atomic":"true"},e.ptm("message")),[t.templates.container?(i(),y(k(t.templates.container),{key:0,message:t.message,closeCallback:a.onCloseClick},null,8,["message","closeCallback"])):(i(),m("div",c({key:1,class:[e.cx("messageContent"),t.message.contentStyleClass]},e.ptm("messageContent")),[t.templates.message?(i(),y(k(t.templates.message),{key:1,message:t.message},null,8,["message"])):(i(),m(x,{key:0},[(i(),y(k(t.templates.messageicon?t.templates.messageicon:t.templates.icon?t.templates.icon:a.iconComponent&&a.iconComponent.name?a.iconComponent:"span"),c({class:e.cx("messageIcon")},e.ptm("messageIcon")),null,16,["class"])),n("div",c({class:e.cx("messageText")},e.ptm("messageText")),[n("span",c({class:e.cx("summary")},e.ptm("summary")),b(t.message.summary),17),n("div",c({class:e.cx("detail")},e.ptm("detail")),b(t.message.detail),17)],16)],64)),t.message.closable!==!1?(i(),m("div",H(c({key:2},e.ptm("buttonContainer"))),[L((i(),m("button",c({class:e.cx("closeButton"),type:"button","aria-label":a.closeAriaLabel,onClick:o[0]||(o[0]=(...l)=>a.onCloseClick&&a.onCloseClick(...l)),autofocus:""},{...t.closeButtonProps,...e.ptm("closeButton")}),[(i(),y(k(t.templates.closeicon||"TimesIcon"),c({class:[e.cx("closeIcon"),t.closeIcon]},e.ptm("closeIcon")),null,16,["class"]))],16,be)),[[s]])],16)):D("",!0)],16))],16)}const ye=N(he,[["render",Ce]]);var ve=0;const we={name:"Toast",extends:me,inheritAttrs:!1,emits:["close","life-end"],data(){return{messages:[]}},styleElement:null,mounted(){h.on("add",this.onAdd),h.on("remove",this.onRemove),h.on("remove-group",this.onRemoveGroup),h.on("remove-all-groups",this.onRemoveAllGroups),this.breakpoints&&this.createStyle()},beforeUnmount(){this.destroyStyle(),this.$refs.container&&this.autoZIndex&&S.clear(this.$refs.container),h.off("add",this.onAdd),h.off("remove",this.onRemove),h.off("remove-group",this.onRemoveGroup),h.off("remove-all-groups",this.onRemoveAllGroups)},methods:{add(e){if(e.id==null&&(e.id=ve++),this.notificationsStore.shouldBeShown){this.messages=[e];return}this.messages=[...this.messages,e]},remove(e){const o=this.messages.findIndex(t=>t.id===e.message.id);o!==-1&&(this.messages.splice(o,1),this.$emit(e.type,{message:e.message}))},onAdd(e){this.group==e.group&&this.add(e)},onRemove(e){this.remove({message:e,type:"close"})},onRemoveGroup(e){this.group===e&&(this.messages=[])},onRemoveAllGroups(){this.messages=[]},onEnter(){this.$refs.container.setAttribute(this.attributeSelector,""),this.autoZIndex&&S.set("modal",this.$refs.container,this.baseZIndex||this.$primevue.config.zIndex.modal)},onLeave(){this.$refs.container&&this.autoZIndex&&ne(this.messages)&&setTimeout(()=>{S.clear(this.$refs.container)},200)},createStyle(){var e,o,t;if(!this.styleElement&&!this.isUnstyled){this.styleElement=document.createElement("style"),this.styleElement.type="text/css",ae(this.styleElement,"nonce",(t=(o=(e=this.$primevue)==null?void 0:e.config)==null?void 0:o.csp)==null?void 0:t.nonce),document.head.appendChild(this.styleElement);let u="";for(let r in this.breakpoints){let a="";for(let s in this.breakpoints[r])a+=s+":"+this.breakpoints[r][s]+"!important;";u+=`
                        @media screen and (max-width: ${r}) {
                            .p-toast[${this.attributeSelector}] {
                                ${a}
                            }
                        }
                    `}this.styleElement.innerHTML=u}},destroyStyle(){this.styleElement&&(document.head.removeChild(this.styleElement),this.styleElement=null)}},computed:{...U(j),attributeSelector(){return F()}},components:{ToastMessage:ye}};function $e(e,o,t,u,r,a){const s=X("ToastMessage");return i(),m("div",c({ref:"container",class:e.cx("root"),style:e.sx("root",!0,{position:e.position})},e.ptmi("root")),[C(q,c({name:"p-toast-message",tag:"div",onEnter:a.onEnter,onLeave:a.onLeave},{...e.ptm("transition")}),{default:A(()=>[(i(!0),m(x,null,R(r.messages,l=>(i(),y(s,{key:l.id,message:l,templates:e.$slots,closeIcon:e.closeIcon,infoIcon:e.infoIcon,warnIcon:e.warnIcon,errorIcon:e.errorIcon,successIcon:e.successIcon,closeButtonProps:e.closeButtonProps,unstyled:e.unstyled,onClose:o[0]||(o[0]=p=>a.remove(p)),pt:e.pt},null,8,["message","templates","closeIcon","infoIcon","warnIcon","errorIcon","successIcon","closeButtonProps","unstyled","pt"]))),128))]),_:1},16,["onEnter","onLeave"])],16)}const ke=N(we,[["render",$e]]),xe={class:"block space-y-1 rounded bg-white/50 p-3 text-sm backdrop-blur-xl hover:bg-white/25 active:bg-white/50 dark:bg-black/30 dark:hover:bg-black/50 dark:active:bg-black/30"},Ie={class:"flex items-center justify-between"},Te={class:"font-medium"},Se={class:"leading-5 text-gray-700 dark:text-gray-400"},Le={class:"flex flex-1 flex-col overflow-hidden pr-2"},Ze={class:"flex items-center justify-between py-4 pl-4"},Be={class:"text-lg font-semibold"},ze={class:"flex-1 space-y-2 overflow-y-auto px-4 scrollbar-thin scrollbar-track-rounded-[100px] scrollbar-thumb-rounded-[100px] scrollbar-corner-rounded-[100px] dark:scrollbar-track-gray-500/80 dark:scrollbar-thumb-gray-400/80"},Ee={class:"block space-y-1 rounded bg-white/50 p-3 text-sm hover:bg-white/25 active:bg-white/50 dark:bg-black/30 dark:hover:bg-black/50 dark:active:bg-black/30"},Me={class:"flex items-center justify-between"},_e={class:"font-medium"},Ae={class:"leading-5 text-gray-700 dark:text-gray-400"},je={class:"text-gray-600 dark:text-gray-500"},Re={class:"flex justify-between"},De=Y({__name:"NotificationsOverlay",props:{isOpen:{type:Boolean,default:!1}},emits:["close"],setup(e,{emit:o}){const t=J(),u=K(),r=j(),a=Q(),s=o;W(a,()=>{s("close")});const l=()=>{s("close"),u.open("settings",{tab:"notifications"})},p=ee(()=>r.shouldBeShown?{root:{style:"width: 80%"}}:{});return($,g)=>(i(),m(x,null,[(i(),y(_,{to:"#laptop",defer:""},[L(C(ke,{position:d(r).shouldBeShown?"top-center":"bottom-right",group:"headless",to:"#laptop",pt:p.value},{container:A(({message:f,closeCallback:T})=>[n("div",xe,[n("div",Ie,[n("h3",Te,b(f.summary),1),C(d(w),{icon:"pi pi-times",size:"small",rounded:"",outlined:"","aria-label":"Close",onClick:v(T,["prevent"])},null,8,["onClick"])]),n("p",Se,b(f.detail),1)])]),_:1},8,["position","pt"]),[[M,!e.isOpen]])])),(i(),y(_,{to:"#laptop",defer:""},[L(n("div",{ref_key:"overlay",ref:a,id:"notifications-area",class:"absolute bottom-0 right-0 top-0 z-[999] flex w-96 transform flex-col bg-gray-100/60 backdrop-blur-xl dark:bg-gray-800/60"},[n("div",Le,[n("div",Ze,[n("span",Be,b(d(t).t("notifications_overlay_title")),1),C(d(w),{icon:"pi pi-times","aria-label":"Close",size:"small",link:"",onClick:g[0]||(g[0]=v(f=>s("close"),["prevent"]))})]),n("div",ze,[(i(!0),m(x,null,R(d(r).notifications,(f,T)=>(i(),m("div",Ee,[n("div",Me,[n("h3",_e,b(f.summary),1),C(d(w),{icon:"pi pi-times",size:"small",rounded:"",outlined:"","aria-label":"Close",onClick:v(Ve=>d(r).close(T),["prevent"])},null,8,["onClick"])]),n("p",Ae,b(f.detail),1),n("p",je,b(d(te)(f.time)),1)]))),256))]),n("div",Re,[C(d(w),{label:d(t).t("notifications_overlay_settings_button"),onClick:g[1]||(g[1]=v(f=>l(),["prevent"])),link:"",size:"small"},null,8,["label"]),C(d(w),{label:d(t).t("notifications_overlay_clear_button"),onClick:g[2]||(g[2]=v(f=>d(r).clear(),["prevent"])),link:"",size:"small"},null,8,["label"])])])],512),[[M,e.isOpen]])]))],64))}});export{De as default};
