/*
 Use it if you like it
 jsPDF 0.9.0rc2 ( ${buildDate} ${commitID} )
 Copyright (c) 2010-2012 James Hall, james@snapshotmedia.co.uk, https://github.com/MrRio/jsPDF
 Copyright (c) 2012 Willow Systems Corporation, willow-systems.com
 MIT license.

 -----------------------------------------------------------------------------------------------
 JavaScript PubSub library
 2012 (c) ddotsenko@willowsystems.com
 based on Peter Higgins (dante@dojotoolkit.org)
 Loosely based on Dojo publish/subscribe API, limited in scope. Rewritten blindly.
 Original is (c) Dojo Foundation 2004-2010. Released under either AFL or new BSD, see:
 http://dojofoundation.org/license for more information.
 -----------------------------------------------------------------------------------------------

 jsPDF addImage plugin (JPEG only at this time)
 Copyright (c) 2012 https://github.com/siefkenj/
 */
AmCharts.AmExport = AmCharts.Class({
    construct: function (e, b, c) {
        this.DEBUG = !1;
        this.chart = e;
        this.canvas = null;
        this.svgs = [];
        this.userCFG = b;
        this.buttonIcon = "export.png";
        this.exportPNG = !0;
        this.exportSVG = this.exportJPG = this.exportPDF = !1;
        this.top = this.right = 0;
        this.buttonRollOverColor = "#EFEFEF";
        this.textRollOverColor = "#CC0000";
        this.buttonTitle = "Save chart as an image";
        this.buttonAlpha = .75;
        this.imageFileName = "amChart";
        this.imageBackgroundColor = "#FFFFFF";
        c && this.init()
    }, toCoordinate: function (e) {
        return void 0 ===
        e ? "auto" : -1 != String(e).indexOf("%") ? e : e + "px"
    }, init: function () {
        var e = this, b = [];
        e.exportPNG && b.push("png");
        e.exportPDF && b.push("pdf");
        e.exportJPG && b.push("jpg");
        e.exportSVG && b.push("svg");
        var c = [];
        if (1 == b.length)c.push({
            format: b[0],
            iconTitle: e.buttonTitle,
            icon: e.chart.pathToImages + e.buttonIcon
        }); else if (1 < b.length) {
            for (var a = [], d = 0; d < b.length; d++)a.push({format: b[d], title: b[d].toUpperCase()});
            c.push({
                onclick: function () {
                }, icon: e.chart.pathToImages + e.buttonIcon, items: a
            })
        }
        b = e.color;
        void 0 === b && (b = e.chart.color);
        a = e.buttonColor;
        void 0 === a && (a = "transparent");
        e.cfg = {
            menuTop: e.toCoordinate(e.top),
            menuLeft: e.toCoordinate(e.left),
            menuRight: e.toCoordinate(e.right),
            menuBottom: e.toCoordinate(e.bottom),
            menuItems: c,
            menuItemStyle: {
                backgroundColor: a,
                opacity: e.buttonAlpha,
                rollOverBackgroundColor: e.buttonRollOverColor,
                color: b,
                rollOverColor: e.textRollOverColor,
                paddingTop: "6px",
                paddingRight: "6px",
                paddingBottom: "6px",
                paddingLeft: "6px",
                marginTop: "0px",
                marginRight: "0px",
                marginBottom: "0px",
                marginLeft: "0px",
                textAlign: "left",
                textDecoration: "none",
                fontFamily: e.chart.fontFamily,
                fontSize: e.chart.fontSize + "px"
            },
            menuItemOutput: {
                backgroundColor: e.imageBackgroundColor,
                fileName: e.imageFileName,
                format: "png",
                output: "dataurlnewwindow",
                render: "browser",
                dpi: 90,
                onclick: function (a, d, b) {
                    b.preventDefault();
                    a.output(d)
                }
            },
            removeImagery: !0
        };
        e.processing = {buffer: [], drawn: 0, timer: 0};
        "undefined" != typeof window.canvg && "undefined" != typeof window.RGBColor && (e.cfg.menuItemOutput.render = "canvg");
        "undefined" != typeof window.saveAs && (e.cfg.menuItemOutput.output =
            "save");
        AmCharts.isIE && 10 > AmCharts.IEversion && (e.cfg.menuItemOutput.output = "dataurlnewwindow");
        if (c = e.userCFG)c.menuItemOutput = AmCharts.extend(e.cfg.menuItemOutput, c.menuItemOutput || {}), c.menuItemStyle = AmCharts.extend(e.cfg.menuItemStyle, c.menuItemStyle || {}), e.cfg = AmCharts.extend(e.cfg, c);
        e.chart.AmExport = e;
        e.chart.addListener("rendered", function () {
            e.setup()
        });
        e.DEBUG && (window.AmExport = e)
    }, log: function () {
        console.log("AmExport: ", arguments)
    }, setup: function () {
        10 == this.DEBUG && this.log("SETUP START");
        !AmCharts.isIE || AmCharts.isIE && 9 < AmCharts.IEversion ? (this.generateButtons(), 10 == this.DEBUG && this.log("SETUP END")) : 10 == this.DEBUG && this.log("< IE10 NOT SUPPORTED")
    }, generateBinaryArray: function (e) {
        for (var b = e.length, c = new Uint8Array(b / 4 * 3 | 0), a = 0, d = 0, g = [0, 0], h = 0, l = 0, f, k, p = new Uint8Array([62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, 0, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46,
            47, 48, 49, 50, 51]); b--;)k = e.charCodeAt(a++), f = p[k - 43], 255 !== f && void 0 !== f && (g[1] = g[0], g[0] = k, l = l << 6 | f, h++, 4 === h && (c[d++] = l >>> 16, 61 !== g[1] && (c[d++] = l >>> 8), 61 !== g[0] && (c[d++] = l), h = 0));
        return c
    }, generateBlob: function (e, b) {
        var c = "image/svg+xml" != b ? e.indexOf(",") + 1 : 0, a = e.substring(0, c), d = e, g = new Blob;
        -1 != a.indexOf("base64") && (d = this.generateBinaryArray(e.substring(c)));
        AmCharts.isIE && 10 > AmCharts.IEversion ? (g.data = d, g.size = d.length, g.type = b, g.encoding = "base64") : g = new Blob([d], {type: b});
        return g
    }, generatePDF: function (e) {
        var b =
        {
            output: function () {
                return ""
            }
        }, c = this.canvas.toDataURL("image/jpeg"), a = 25.4 * this.canvas.width / e.dpi;
        e = 25.4 * this.canvas.height / e.dpi;
        window.jsPDF ? (b = new jsPDF, b.addImage ? b.addImage(c, "JPEG", 0, 0, a, e) : alert("Missing jsPDF plugin; Please add the 'addImage' plugin.")) : alert("Missing jsPDF lib; Don't forget to add the addImage plugin.");
        return b
    }, output: function (e, b) {
        var c = this;
        e = AmCharts.extend(AmCharts.extend({}, c.cfg.menuItemOutput), e || {});
        c.chart.prepareForExport && c.chart.prepareForExport();
        return c.generateOutput(e,
            function () {
                var a = null, d;
                10 == c.DEBUG && c.log("OUTPUT", e.format);
                if ("image/svg+xml" == e.format || "svg" == e.format)a = c.generateSVG(), d = c.generateBlob(a, "image/svg+xml"), "save" == e.output ? saveAs(d, e.fileName + ".svg") : "datastring" == e.output || "datauristring" == e.output || "dataurlstring" == e.output ? d = "data:image/svg+xml;base64," + btoa(a) : "dataurlnewwindow" == e.output ? window.open("data:image/svg+xml;base64," + btoa(a)) : "datauri" == e.output || "dataurl" == e.output ? location.href = "data:image/svg+xml;base64," + btoa(a) : "datastream" ==
                e.output && (location.href = "data:image/octet-stream;base64," + a), b && b.apply(c, [d]); else if ("application/pdf" == e.format || "pdf" == e.format)a = c.generatePDF(e).output("dataurlstring"), d = c.generateBlob(a, "application/pdf"), "save" == e.output ? saveAs(d, e.fileName + ".pdf") : "datastring" == e.output || "datauristring" == e.output || "dataurlstring" == e.output ? d = a : "dataurlnewwindow" == e.output ? window.open(a) : "datauri" == e.output || "dataurl" == e.output ? location.href = a : "datastream" == e.output && (location.href = a.replace("application/pdf",
                    "application/octet-stream")), b && b.apply(c, [d]); else if ("image/png" == e.format || "png" == e.format)a = c.canvas.toDataURL("image/png"), d = c.generateBlob(a, "image/png"), "save" == e.output ? saveAs(d, e.fileName + ".png") : "datastring" == e.output || "datauristring" == e.output || "dataurlstring" == e.output ? d = a : "dataurlnewwindow" == e.output ? window.open(a) : "datauri" == e.output || "dataurl" == e.output ? location.href = a : "datastream" == e.output && (location.href = a.replace("image/png", "image/octet-stream")), b && b.apply(c, [d]); else if ("image/jpeg" ==
                    e.format || "jpeg" == e.format || "jpg" == e.format)a = c.canvas.toDataURL("image/jpeg"), d = c.generateBlob(a, "image/jpeg"), "save" == e.output ? saveAs(d, e.fileName + ".jpg") : "datastring" == e.output || "datauristring" == e.output || "dataurlstring" == e.output ? d = a : "dataurlnewwindow" == e.output ? window.open(a) : "datauri" == e.output || "dataurl" == e.output ? location.href = a : "datastream" == e.output && (location.href = a.replace("image/jpeg", "image/octet-stream")), b && b.apply(c, [d])
            })
    }, polifySVG: function (e) {
        function b(a, d) {
            for (var b = a.getElementsByTagName(d),
                     h = b.length; h--;) {
                if (c.cfg.removeImagery)b[h].parentNode.removeChild(b[h]); else {
                    var l = document.createElement("img"), f = document.createElement("canvas"), k = f.getContext("2d");
                    f.width = b[h].getAttribute("width");
                    f.height = b[h].getAttribute("height");
                    l.src = b[h].getAttribute("xlink:href");
                    l.width = b[h].getAttribute("width");
                    l.height = b[h].getAttribute("height");
                    try {
                        k.drawImage(l, 0, 0, l.width, l.height), datastring = f.toDataURL()
                    } catch (e) {
                        throw datastring = l.src, c.log("Tainted canvas, reached browser CORS security; origin from imagery must be equal to the server!"),
                            Error(e);
                    }
                    b[h].setAttribute("xlink:href", datastring)
                }
                10 == c.DEBUG && c.log("POLIFIED", b[h])
            }
        }

        var c = this;
        0 == AmCharts.IEversion && (e.setAttribute("xmlns", "http://www.w3.org/2000/svg"), c.cfg.removeImagery || e.setAttribute("xmlns:xlink", "http://www.w3.org/1999/xlink"));
        10 == c.DEBUG && c.log("POLIFIED", e);
        b(e, "pattern");
        b(e, "image");
        c.svgs.push(e);
        return e
    }, generateSVG: function () {
        var e = document.createElement("svg");
        e.setAttribute("xmlns", "http://www.w3.org/2000/svg");
        e.setAttribute("xmlns:xlink", "http://www.w3.org/1999/xlink");
        for (var b = 0; b < this.processing.buffer.length; b++) {
            var c = document.createElement("g"), a = this.processing.buffer[b];
            a[0].setAttribute("xmlns", "http://www.w3.org/2000/svg");
            a[0].setAttribute("xmlns:xlink", "http://www.w3.org/1999/xlink");
            c.setAttribute("transform", "translate(" + a[1].x + "," + a[1].y + ")");
            c.appendChild(a[0]);
            e.appendChild(c)
        }
        return (new XMLSerializer).serializeToString(e)
    }, generateOutput: function (e, b) {
        function c() {
            var d, g, f;
            if (a.processing.buffer.length == a.processing.drawn || "svg" == e.format)return 10 ==
            a.DEBUG && a.log("END DRAWING"), b();
            10 == a.DEBUG && a.log("DRAW", a.processing.drawn + 1, "OF", a.processing.buffer.length);
            g = a.processing.buffer[a.processing.drawn];
            f = (new XMLSerializer).serializeToString(g[0]);
            d = g[1];
            10 == a.DEBUG && a.log("SOURCE", f);
            if ("browser" == e.render) {
                if (d = new Image, d.id = AmCharts.getUniqueId(), f = "data:image/svg+xml;base64," + btoa(f), d.onload = function () {
                        l.drawImage(this, g[1].x, g[1].y);
                        a.processing.drawn++;
                        10 == a.DEBUG && a.log("ONLOAD", this);
                        c()
                    }, d.onerror = function () {
                        10 == a.DEBUG && a.log("ONERROR",
                            this);
                        l.drawImage(this, g[1].x, g[1].y);
                        a.processing.drawn++;
                        c()
                    }, d.src = f, 10 == a.DEBUG && a.log("ADD", d), d.complete || "undefined" == typeof d.complete || void 0 === d.complete)10 == a.DEBUG && a.log("FORCE ONLOAD", d), d.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==", d.src = f
            } else"canvg" == e.render && canvg(h, f, {
                offsetX: d.x,
                offsetY: d.y,
                ignoreMouse: !0,
                ignoreAnimation: !0,
                ignoreDimensions: !0,
                ignoreClear: !0,
                renderCallback: function () {
                    a.processing.drawn++;
                    c()
                }
            })
        }

        for (var a = this, d = [], g = [], h = document.createElement("canvas"),
                 l = h.getContext("2d"), f = {
                y: 0,
                x: 0
            }, d = a.chart.div.getElementsByTagName("svg"), k = 0; k < d.length; k++)g.push(d[k]);
        a.chart.legend && "outside" == a.chart.legend.position && (a.chart.legend.container.container.externalLegend = !0, g.push(a.chart.legend.container.container), "left" == a.cfg.legendPosition ? f.x = a.chart.legend.div.offsetWidth : "top" == a.cfg.legendPosition ? f.y = a.chart.legend.div.offsetHeight : "object" == typeof a.cfg.legendPosition && (f.y = a.cfg.legendPosition.chartTop, f.x = a.cfg.legendPosition.chartLeft));
        a.processing.buffer =
            [];
        a.processing.drawn = 0;
        a.canvas = h;
        a.svgs = [];
        10 == a.DEBUG && a.log("START EXPORT");
        10 == a.DEBUG && a.log("START BUFFERING");
        for (k = 0; k < g.length; k++) {
            var d = g[k].parentNode, p = Number(d.style.left.slice(0, -2)), n = Number(d.style.top.slice(0, -2)), m = a.polifySVG(g[k].cloneNode(!0)), q = AmCharts.extend({}, f);
            g[k].externalLegend ? "right" == a.cfg.legendPosition ? (f.y = 0, f.x = a.chart.divRealWidth) : "bottom" == a.cfg.legendPosition ? f.y = n ? n : f.y : "object" == typeof a.cfg.legendPosition ? (f.x = a.cfg.legendPosition.left, f.y = a.cfg.legendPosition.top) :
                (f.x = 0, f.y = 0) : "relative" == d.style.position ? (f.x = p ? p : f.x, f.y = n ? n : f.y) : (f.x = p, f.y = n);
            a.processing.buffer.push([m, AmCharts.extend({}, f)]);
            n && p ? f = q : f.y += n ? 0 : d.offsetHeight;
            10 == a.DEBUG && a.log("BUFFERED", g[k], f)
        }
        10 == a.DEBUG && a.log("END BUFFERING");
        10 == a.DEBUG && a.log("START DRAWING", e.render);
        10 == a.DEBUG && a.log("FILL BACKGROUND");
        h.id = AmCharts.getUniqueId();
        h.width = a.chart.divRealWidth;
        h.height = a.chart.divRealHeight;
        a.chart.legend && "outside" == a.chart.legend.position && (-1 != ["left", "right"].indexOf(a.cfg.legendPosition) ?
            h.width += a.chart.legend.div.offsetWidth : "object" == typeof a.cfg.legendPosition ? (h.width += a.cfg.legendPosition.width, h.height += a.cfg.legendPosition.height) : h.height += a.chart.legend.div.offsetHeight);
        g = !1;
        a.chart.periodSelector && (-1 != ["left", "right"].indexOf(a.chart.periodSelector.position) ? (h.width -= a.chart.periodSelector.div.offsetWidth + 16, g = !0) : h.height -= a.chart.periodSelector.div.offsetHeight);
        a.chart.dataSetSelector && (-1 != ["left", "right"].indexOf(a.chart.dataSetSelector.position) ? g || (h.width -= a.chart.dataSetSelector.div.offsetWidth +
        16) : h.height -= a.chart.dataSetSelector.div.offsetHeight);
        if (e.backgroundColor || "image/jpeg" == e.format)l.fillStyle = e.backgroundColor || "#FFFFFF", l.fillRect(0, 0, h.width, h.height);
        return c()
    }, generateButtons: function () {
        function e(a) {
            var d = document.createElement("ul");
            d.setAttribute("style", "list-style: none; margin: 0; padding: 0;");
            for (var g = 0; g < a.length; g++) {
                var h = document.createElement("li"), l = document.createElement("img"), f = document.createElement("a"), k = a[g], p = null, n = AmCharts.extend(AmCharts.extend({},
                    b.cfg.menuItemStyle), a[g]), k = AmCharts.extend(AmCharts.extend({}, b.cfg.menuItemOutput), k);
                k.icon && (l.alt = "", l.src = k.icon, l.setAttribute("style", "margin: 0 auto;border: none;outline: none"), k.iconTitle && (l.title = k.iconTitle), f.appendChild(l));
                f.href = "#";
                k.title && (l.setAttribute("style", "margin: 0px 5px;"), f.innerHTML += k.title);
                f.setAttribute("style", "display: block;");
                AmCharts.extend(f.style, n);
                f.onclick = k.onclick.bind(f, b, k);
                h.appendChild(f);
                k.items && (p = e(k.items), h.appendChild(p), h.onmouseover = function () {
                    p.style.display =
                        "block"
                }, h.onmouseout = function () {
                    p.style.display = "none"
                }, p.style.display = "none");
                d.appendChild(h);
                f.onmouseover = function () {
                    this.style.backgroundColor = n.rollOverBackgroundColor;
                    this.style.color = n.rollOverColor;
                    this.style.borderColor = n.rollOverBorderColor
                };
                f.onmouseout = function () {
                    this.style.backgroundColor = n.backgroundColor;
                    this.style.color = n.color;
                    this.style.borderColor = n.borderColor
                }
            }
            c++;
            10 == b.DEBUG && b.log("MENU", d);
            return d
        }

        var b = this, c = 0;
        b.div ? (div = b.div, div.innerHTML = "") : (div = document.createElement("div"),
            b.div = div);
        div.setAttribute("style", "position: absolute;top:" + b.cfg.menuTop + ";right:" + b.cfg.menuRight + ";bottom:" + b.cfg.menuBottom + ";left:" + b.cfg.menuLeft + ";");
        div.setAttribute("class", "amExportButton");
        div.appendChild(e(b.cfg.menuItems));
        b.chart.containerDiv.appendChild(div)
    }
});
(function () {
    function e() {
        var b = {
            FRAMERATE: 30, MAX_VIRTUAL_PIXELS: 3E4, init: function (c) {
                var a = 0;
                b.UniqueId = function () {
                    a++;
                    return "canvg" + a
                };
                b.Definitions = {};
                b.Styles = {};
                b.Animations = [];
                b.Images = [];
                b.ctx = c;
                b.ViewPort = new function () {
                    this.viewPorts = [];
                    this.Clear = function () {
                        this.viewPorts = []
                    };
                    this.SetCurrent = function (a, b) {
                        this.viewPorts.push({width: a, height: b})
                    };
                    this.RemoveCurrent = function () {
                        this.viewPorts.pop()
                    };
                    this.Current = function () {
                        return this.viewPorts[this.viewPorts.length - 1]
                    };
                    this.width = function () {
                        return this.Current().width
                    };
                    this.height = function () {
                        return this.Current().height
                    };
                    this.ComputeSize = function (a) {
                        return null != a && "number" == typeof a ? a : "x" == a ? this.width() : "y" == a ? this.height() : Math.sqrt(Math.pow(this.width(), 2) + Math.pow(this.height(), 2)) / Math.sqrt(2)
                    }
                }
            }
        };
        b.init();
        b.ImagesLoaded = function () {
            for (var c = 0; c < b.Images.length; c++)if (!b.Images[c].loaded)return !1;
            return !0
        };
        b.trim = function (b) {
            return b.replace(/^\s+|\s+$/g, "")
        };
        b.compressSpaces = function (b) {
            return b.replace(/[\s\r\t\n]+/gm, " ")
        };
        b.ajax = function (b) {
            var a;
            return (a =
                window.XMLHttpRequest ? new XMLHttpRequest : new ActiveXObject("Microsoft.XMLHTTP")) ? (a.open("GET", b, !1), a.send(null), a.responseText) : null
        };
        b.parseXml = function (b) {
            if (window.DOMParser)return (new DOMParser).parseFromString(b, "text/xml");
            b = b.replace(/<!DOCTYPE svg[^>]*>/, "");
            var a = new ActiveXObject("Microsoft.XMLDOM");
            a.async = "false";
            a.loadXML(b);
            return a
        };
        b.Property = function (b, a) {
            this.name = b;
            this.value = a
        };
        b.Property.prototype.getValue = function () {
            return this.value
        };
        b.Property.prototype.hasValue = function () {
            return null !=
                this.value && "" !== this.value
        };
        b.Property.prototype.numValue = function () {
            if (!this.hasValue())return 0;
            var b = parseFloat(this.value);
            (this.value + "").match(/%$/) && (b /= 100);
            return b
        };
        b.Property.prototype.valueOrDefault = function (b) {
            return this.hasValue() ? this.value : b
        };
        b.Property.prototype.numValueOrDefault = function (b) {
            return this.hasValue() ? this.numValue() : b
        };
        b.Property.prototype.addOpacity = function (c) {
            var a = this.value;
            if (null != c && "" != c && "string" == typeof this.value) {
                var d = new RGBColor(this.value);
                d.ok && (a =
                    "rgba(" + d.r + ", " + d.g + ", " + d.b + ", " + c + ")")
            }
            return new b.Property(this.name, a)
        };
        b.Property.prototype.getDefinition = function () {
            var c = this.value.match(/#([^\)'"]+)/);
            c && (c = c[1]);
            c || (c = this.value);
            return b.Definitions[c]
        };
        b.Property.prototype.isUrlDefinition = function () {
            return 0 == this.value.indexOf("url(")
        };
        b.Property.prototype.getFillStyleDefinition = function (c, a) {
            var d = this.getDefinition();
            if (null != d && d.createGradient)return d.createGradient(b.ctx, c, a);
            if (null != d && d.createPattern) {
                if (d.getHrefAttribute().hasValue()) {
                    var g =
                        d.attribute("patternTransform"), d = d.getHrefAttribute().getDefinition();
                    g.hasValue() && (d.attribute("patternTransform", !0).value = g.value)
                }
                return d.createPattern(b.ctx, c)
            }
            return null
        };
        b.Property.prototype.getDPI = function (b) {
            return 96
        };
        b.Property.prototype.getEM = function (c) {
            var a = 12, d = new b.Property("fontSize", b.Font.Parse(b.ctx.font).fontSize);
            d.hasValue() && (a = d.toPixels(c));
            return a
        };
        b.Property.prototype.getUnits = function () {
            return (this.value + "").replace(/[0-9\.\-]/g, "")
        };
        b.Property.prototype.toPixels =
            function (c, a) {
                if (!this.hasValue())return 0;
                var d = this.value + "";
                if (d.match(/em$/))return this.numValue() * this.getEM(c);
                if (d.match(/ex$/))return this.numValue() * this.getEM(c) / 2;
                if (d.match(/px$/))return this.numValue();
                if (d.match(/pt$/))return this.numValue() * this.getDPI(c) * (1 / 72);
                if (d.match(/pc$/))return 15 * this.numValue();
                if (d.match(/cm$/))return this.numValue() * this.getDPI(c) / 2.54;
                if (d.match(/mm$/))return this.numValue() * this.getDPI(c) / 25.4;
                if (d.match(/in$/))return this.numValue() * this.getDPI(c);
                if (d.match(/%$/))return this.numValue() * b.ViewPort.ComputeSize(c);
                d = this.numValue();
                return a && 1 > d ? d * b.ViewPort.ComputeSize(c) : d
            };
        b.Property.prototype.toMilliseconds = function () {
            if (!this.hasValue())return 0;
            var b = this.value + "";
            if (b.match(/s$/))return 1E3 * this.numValue();
            b.match(/ms$/);
            return this.numValue()
        };
        b.Property.prototype.toRadians = function () {
            if (!this.hasValue())return 0;
            var b = this.value + "";
            return b.match(/deg$/) ? this.numValue() * (Math.PI / 180) : b.match(/grad$/) ? this.numValue() * (Math.PI / 200) : b.match(/rad$/) ?
                this.numValue() : this.numValue() * (Math.PI / 180)
        };
        b.Font = new function () {
            this.Styles = "normal|italic|oblique|inherit";
            this.Variants = "normal|small-caps|inherit";
            this.Weights = "normal|bold|bolder|lighter|100|200|300|400|500|600|700|800|900|inherit";
            this.CreateFont = function (a, d, g, h, c, f) {
                f = null != f ? this.Parse(f) : this.CreateFont("", "", "", "", "", b.ctx.font);
                return {
                    fontFamily: c || f.fontFamily,
                    fontSize: h || f.fontSize,
                    fontStyle: a || f.fontStyle,
                    fontWeight: g || f.fontWeight,
                    fontVariant: d || f.fontVariant,
                    toString: function () {
                        return [this.fontStyle,
                            this.fontVariant, this.fontWeight, this.fontSize, this.fontFamily].join(" ")
                    }
                }
            };
            var c = this;
            this.Parse = function (a) {
                var d = {};
                a = b.trim(b.compressSpaces(a || "")).split(" ");
                for (var g = !1, h = !1, l = !1, f = !1, k = "", e = 0; e < a.length; e++)h || -1 == c.Styles.indexOf(a[e]) ? f || -1 == c.Variants.indexOf(a[e]) ? l || -1 == c.Weights.indexOf(a[e]) ? g ? "inherit" != a[e] && (k += a[e]) : ("inherit" != a[e] && (d.fontSize = a[e].split("/")[0]), h = f = l = g = !0) : ("inherit" != a[e] && (d.fontWeight = a[e]), h = f = l = !0) : ("inherit" != a[e] && (d.fontVariant = a[e]), h = f = !0) : ("inherit" !=
                a[e] && (d.fontStyle = a[e]), h = !0);
                "" != k && (d.fontFamily = k);
                return d
            }
        };
        b.ToNumberArray = function (c) {
            c = b.trim(b.compressSpaces((c || "").replace(/,/g, " "))).split(" ");
            for (var a = 0; a < c.length; a++)c[a] = parseFloat(c[a]);
            return c
        };
        b.Point = function (b, a) {
            this.x = b;
            this.y = a
        };
        b.Point.prototype.angleTo = function (b) {
            return Math.atan2(b.y - this.y, b.x - this.x)
        };
        b.Point.prototype.applyTransform = function (b) {
            var a = this.x * b[1] + this.y * b[3] + b[5];
            this.x = this.x * b[0] + this.y * b[2] + b[4];
            this.y = a
        };
        b.CreatePoint = function (c) {
            c = b.ToNumberArray(c);
            return new b.Point(c[0], c[1])
        };
        b.CreatePath = function (c) {
            c = b.ToNumberArray(c);
            for (var a = [], d = 0; d < c.length; d += 2)a.push(new b.Point(c[d], c[d + 1]));
            return a
        };
        b.BoundingBox = function (b, a, d, g) {
            this.y2 = this.x2 = this.y1 = this.x1 = Number.NaN;
            this.x = function () {
                return this.x1
            };
            this.y = function () {
                return this.y1
            };
            this.width = function () {
                return this.x2 - this.x1
            };
            this.height = function () {
                return this.y2 - this.y1
            };
            this.addPoint = function (a, d) {
                if (null != a) {
                    if (isNaN(this.x1) || isNaN(this.x2))this.x2 = this.x1 = a;
                    a < this.x1 && (this.x1 =
                        a);
                    a > this.x2 && (this.x2 = a)
                }
                if (null != d) {
                    if (isNaN(this.y1) || isNaN(this.y2))this.y2 = this.y1 = d;
                    d < this.y1 && (this.y1 = d);
                    d > this.y2 && (this.y2 = d)
                }
            };
            this.addX = function (a) {
                this.addPoint(a, null)
            };
            this.addY = function (a) {
                this.addPoint(null, a)
            };
            this.addBoundingBox = function (a) {
                this.addPoint(a.x1, a.y1);
                this.addPoint(a.x2, a.y2)
            };
            this.addQuadraticCurve = function (a, d, b, g, c, e) {
                b = a + 2 / 3 * (b - a);
                g = d + 2 / 3 * (g - d);
                this.addBezierCurve(a, d, b, b + 1 / 3 * (c - a), g, g + 1 / 3 * (e - d), c, e)
            };
            this.addBezierCurve = function (a, d, b, g, c, e, m, q) {
                var u = [a, d], v =
                    [b, g], A = [c, e], x = [m, q];
                this.addPoint(u[0], u[1]);
                this.addPoint(x[0], x[1]);
                for (i = 0; 1 >= i; i++)a = function (a) {
                    return Math.pow(1 - a, 3) * u[i] + 3 * Math.pow(1 - a, 2) * a * v[i] + 3 * (1 - a) * Math.pow(a, 2) * A[i] + Math.pow(a, 3) * x[i]
                }, d = 6 * u[i] - 12 * v[i] + 6 * A[i], b = -3 * u[i] + 9 * v[i] - 9 * A[i] + 3 * x[i], g = 3 * v[i] - 3 * u[i], 0 == b ? 0 != d && (d = -g / d, 0 < d && 1 > d && (0 == i && this.addX(a(d)), 1 == i && this.addY(a(d)))) : (g = Math.pow(d, 2) - 4 * g * b, 0 > g || (c = (-d + Math.sqrt(g)) / (2 * b), 0 < c && 1 > c && (0 == i && this.addX(a(c)), 1 == i && this.addY(a(c))), d = (-d - Math.sqrt(g)) / (2 * b), 0 < d && 1 > d && (0 ==
                i && this.addX(a(d)), 1 == i && this.addY(a(d)))))
            };
            this.isPointInBox = function (a, d) {
                return this.x1 <= a && a <= this.x2 && this.y1 <= d && d <= this.y2
            };
            this.addPoint(b, a);
            this.addPoint(d, g)
        };
        b.Transform = function (c) {
            var a = this;
            this.Type = {};
            this.Type.translate = function (a) {
                this.p = b.CreatePoint(a);
                this.apply = function (a) {
                    a.translate(this.p.x || 0, this.p.y || 0)
                };
                this.unapply = function (a) {
                    a.translate(-1 * this.p.x || 0, -1 * this.p.y || 0)
                };
                this.applyToPoint = function (a) {
                    a.applyTransform([1, 0, 0, 1, this.p.x || 0, this.p.y || 0])
                }
            };
            this.Type.rotate =
                function (a) {
                    a = b.ToNumberArray(a);
                    this.angle = new b.Property("angle", a[0]);
                    this.cx = a[1] || 0;
                    this.cy = a[2] || 0;
                    this.apply = function (a) {
                        a.translate(this.cx, this.cy);
                        a.rotate(this.angle.toRadians());
                        a.translate(-this.cx, -this.cy)
                    };
                    this.unapply = function (a) {
                        a.translate(this.cx, this.cy);
                        a.rotate(-1 * this.angle.toRadians());
                        a.translate(-this.cx, -this.cy)
                    };
                    this.applyToPoint = function (a) {
                        var d = this.angle.toRadians();
                        a.applyTransform([1, 0, 0, 1, this.p.x || 0, this.p.y || 0]);
                        a.applyTransform([Math.cos(d), Math.sin(d), -Math.sin(d),
                            Math.cos(d), 0, 0]);
                        a.applyTransform([1, 0, 0, 1, -this.p.x || 0, -this.p.y || 0])
                    }
                };
            this.Type.scale = function (a) {
                this.p = b.CreatePoint(a);
                this.apply = function (a) {
                    a.scale(this.p.x || 1, this.p.y || this.p.x || 1)
                };
                this.unapply = function (a) {
                    a.scale(1 / this.p.x || 1, 1 / this.p.y || this.p.x || 1)
                };
                this.applyToPoint = function (a) {
                    a.applyTransform([this.p.x || 0, 0, 0, this.p.y || 0, 0, 0])
                }
            };
            this.Type.matrix = function (a) {
                this.m = b.ToNumberArray(a);
                this.apply = function (a) {
                    a.transform(this.m[0], this.m[1], this.m[2], this.m[3], this.m[4], this.m[5])
                };
                this.applyToPoint = function (a) {
                    a.applyTransform(this.m)
                }
            };
            this.Type.SkewBase = function (d) {
                this.base = a.Type.matrix;
                this.base(d);
                this.angle = new b.Property("angle", d)
            };
            this.Type.SkewBase.prototype = new this.Type.matrix;
            this.Type.skewX = function (d) {
                this.base = a.Type.SkewBase;
                this.base(d);
                this.m = [1, 0, Math.tan(this.angle.toRadians()), 1, 0, 0]
            };
            this.Type.skewX.prototype = new this.Type.SkewBase;
            this.Type.skewY = function (d) {
                this.base = a.Type.SkewBase;
                this.base(d);
                this.m = [1, Math.tan(this.angle.toRadians()), 0, 1, 0, 0]
            };
            this.Type.skewY.prototype = new this.Type.SkewBase;
            this.transforms = [];
            this.apply = function (a) {
                for (var d = 0; d < this.transforms.length; d++)this.transforms[d].apply(a)
            };
            this.unapply = function (a) {
                for (var d = this.transforms.length - 1; 0 <= d; d--)this.transforms[d].unapply(a)
            };
            this.applyToPoint = function (a) {
                for (var d = 0; d < this.transforms.length; d++)this.transforms[d].applyToPoint(a)
            };
            c = b.trim(b.compressSpaces(c)).replace(/\)(\s?,\s?)/g, ") ").split(/\s(?=[a-z])/);
            for (var d = 0; d < c.length; d++) {
                var g = b.trim(c[d].split("(")[0]),
                    h = c[d].split("(")[1].replace(")", ""), h = new this.Type[g](h);
                h.type = g;
                this.transforms.push(h)
            }
        };
        b.AspectRatio = function (c, a, d, g, h, l, f, k, e, n) {
            a = b.compressSpaces(a);
            a = a.replace(/^defer\s/, "");
            var m = a.split(" ")[0] || "xMidYMid";
            a = a.split(" ")[1] || "meet";
            var q = d / g, u = h / l, v = Math.min(q, u), A = Math.max(q, u);
            "meet" == a && (g *= v, l *= v);
            "slice" == a && (g *= A, l *= A);
            e = new b.Property("refX", e);
            n = new b.Property("refY", n);
            e.hasValue() && n.hasValue() ? c.translate(-v * e.toPixels("x"), -v * n.toPixels("y")) : (m.match(/^xMid/) && ("meet" ==
            a && v == u || "slice" == a && A == u) && c.translate(d / 2 - g / 2, 0), m.match(/YMid$/) && ("meet" == a && v == q || "slice" == a && A == q) && c.translate(0, h / 2 - l / 2), m.match(/^xMax/) && ("meet" == a && v == u || "slice" == a && A == u) && c.translate(d - g, 0), m.match(/YMax$/) && ("meet" == a && v == q || "slice" == a && A == q) && c.translate(0, h - l));
            "none" == m ? c.scale(q, u) : "meet" == a ? c.scale(v, v) : "slice" == a && c.scale(A, A);
            c.translate(null == f ? 0 : -f, null == k ? 0 : -k)
        };
        b.Element = {};
        b.EmptyProperty = new b.Property("EMPTY", "");
        b.Element.ElementBase = function (c) {
            this.attributes = {};
            this.styles =
            {};
            this.children = [];
            this.attribute = function (a, d) {
                var g = this.attributes[a];
                if (null != g)return g;
                !0 == d && (g = new b.Property(a, ""), this.attributes[a] = g);
                return g || b.EmptyProperty
            };
            this.getHrefAttribute = function () {
                for (var a in this.attributes)if (a.match(/:href$/))return this.attributes[a];
                return b.EmptyProperty
            };
            this.style = function (a, d) {
                var g = this.styles[a];
                if (null != g)return g;
                var h = this.attribute(a);
                if (null != h && h.hasValue())return this.styles[a] = h;
                h = this.parent;
                if (null != h && (h = h.style(a), null != h && h.hasValue()))return h;
                !0 == d && (g = new b.Property(a, ""), this.styles[a] = g);
                return g || b.EmptyProperty
            };
            this.render = function (a) {
                if ("none" != this.style("display").value && "hidden" != this.attribute("visibility").value) {
                    a.save();
                    if (this.attribute("mask").hasValue()) {
                        var d = this.attribute("mask").getDefinition();
                        null != d && d.apply(a, this)
                    } else this.style("filter").hasValue() ? (d = this.style("filter").getDefinition(), null != d && d.apply(a, this)) : (this.setContext(a), this.renderChildren(a), this.clearContext(a));
                    a.restore()
                }
            };
            this.setContext =
                function (a) {
                };
            this.clearContext = function (a) {
            };
            this.renderChildren = function (a) {
                for (var d = 0; d < this.children.length; d++)this.children[d].render(a)
            };
            this.addChild = function (a, d) {
                var g = a;
                d && (g = b.CreateElement(a));
                g.parent = this;
                this.children.push(g)
            };
            if (null != c && 1 == c.nodeType) {
                for (var a = 0; a < c.childNodes.length; a++) {
                    var d = c.childNodes[a];
                    1 == d.nodeType && this.addChild(d, !0);
                    this.captureTextNodes && 3 == d.nodeType && "" != b.trim(b.compressSpaces(d.nodeValue || d.text || "")) && this.addChild(new b.Element.tspan(d), !1)
                }
                for (a =
                         0; a < c.attributes.length; a++)d = c.attributes[a], this.attributes[d.nodeName] = new b.Property(d.nodeName, d.nodeValue);
                d = b.Styles[c.nodeName];
                if (null != d)for (var g in d)this.styles[g] = d[g];
                if (this.attribute("class").hasValue())for (var a = b.compressSpaces(this.attribute("class").value).split(" "), h = 0; h < a.length; h++) {
                    d = b.Styles["." + a[h]];
                    if (null != d)for (g in d)this.styles[g] = d[g];
                    d = b.Styles[c.nodeName + "." + a[h]];
                    if (null != d)for (g in d)this.styles[g] = d[g]
                }
                if (this.attribute("id").hasValue() && (d = b.Styles["#" + this.attribute("id").value],
                    null != d))for (g in d)this.styles[g] = d[g];
                if (this.attribute("style").hasValue())for (d = this.attribute("style").value.split(";"), a = 0; a < d.length; a++)"" != b.trim(d[a]) && (c = d[a].split(":"), g = b.trim(c[0]), c = b.trim(c[1]), this.styles[g] = new b.Property(g, c));
                this.attribute("id").hasValue() && null == b.Definitions[this.attribute("id").value] && (b.Definitions[this.attribute("id").value] = this)
            }
        };
        b.Element.RenderedElementBase = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.setContext = function (a) {
                if (this.style("fill").isUrlDefinition()) {
                    var d =
                        this.style("fill").getFillStyleDefinition(this, this.style("fill-opacity"));
                    null != d && (a.fillStyle = d)
                } else this.style("fill").hasValue() && (d = this.style("fill"), "currentColor" == d.value && (d.value = this.style("color").value), a.fillStyle = "none" == d.value ? "rgba(0,0,0,0)" : d.value);
                this.style("fill-opacity").hasValue() && (d = new b.Property("fill", a.fillStyle), d = d.addOpacity(this.style("fill-opacity").value), a.fillStyle = d.value);
                this.style("stroke").isUrlDefinition() ? (d = this.style("stroke").getFillStyleDefinition(this,
                    this.style("stroke-opacity")), null != d && (a.strokeStyle = d)) : this.style("stroke").hasValue() && (d = this.style("stroke"), "currentColor" == d.value && (d.value = this.style("color").value), a.strokeStyle = "none" == d.value ? "rgba(0,0,0,0)" : d.value);
                this.style("stroke-opacity").hasValue() && (d = new b.Property("stroke", a.strokeStyle), d = d.addOpacity(this.style("stroke-opacity").value), a.strokeStyle = d.value);
                this.style("stroke-width").hasValue() && (d = this.style("stroke-width").toPixels(), a.lineWidth = 0 == d ? .001 : d);
                this.style("stroke-linecap").hasValue() &&
                (a.lineCap = this.style("stroke-linecap").value);
                this.style("stroke-linejoin").hasValue() && (a.lineJoin = this.style("stroke-linejoin").value);
                this.style("stroke-miterlimit").hasValue() && (a.miterLimit = this.style("stroke-miterlimit").value);
                this.style("stroke-dasharray").hasValue() && (d = b.ToNumberArray(this.style("stroke-dasharray").value), "undefined" != typeof a.setLineDash ? a.setLineDash(d) : "undefined" != typeof a.webkitLineDash ? a.webkitLineDash = d : "undefined" != typeof a.mozDash && (a.mozDash = d), d = this.style("stroke-dashoffset").numValueOrDefault(1),
                    "undefined" != typeof a.lineDashOffset ? a.lineDashOffset = d : "undefined" != typeof a.webkitLineDashOffset ? a.webkitLineDashOffset = d : "undefined" != typeof a.mozDashOffset && (a.mozDashOffset = d));
                "undefined" != typeof a.font && (a.font = b.Font.CreateFont(this.style("font-style").value, this.style("font-variant").value, this.style("font-weight").value, this.style("font-size").hasValue() ? this.style("font-size").toPixels() + "px" : "", this.style("font-family").value).toString());
                this.attribute("transform").hasValue() && (new b.Transform(this.attribute("transform").value)).apply(a);
                this.style("clip-path").hasValue() && (d = this.style("clip-path").getDefinition(), null != d && d.apply(a));
                this.style("opacity").hasValue() && (a.globalAlpha = this.style("opacity").numValue())
            }
        };
        b.Element.RenderedElementBase.prototype = new b.Element.ElementBase;
        b.Element.PathElementBase = function (c) {
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            this.path = function (a) {
                null != a && a.beginPath();
                return new b.BoundingBox
            };
            this.renderChildren = function (a) {
                this.path(a);
                b.Mouse.checkPath(this, a);
                "" != a.fillStyle &&
                (this.attribute("fill-rule").hasValue() ? a.fill(this.attribute("fill-rule").value) : a.fill());
                "" != a.strokeStyle && a.stroke();
                var d = this.getMarkers();
                if (null != d) {
                    if (this.style("marker-start").isUrlDefinition()) {
                        var g = this.style("marker-start").getDefinition();
                        g.render(a, d[0][0], d[0][1])
                    }
                    if (this.style("marker-mid").isUrlDefinition())for (var g = this.style("marker-mid").getDefinition(), h = 1; h < d.length - 1; h++)g.render(a, d[h][0], d[h][1]);
                    this.style("marker-end").isUrlDefinition() && (g = this.style("marker-end").getDefinition(),
                        g.render(a, d[d.length - 1][0], d[d.length - 1][1]))
                }
            };
            this.getBoundingBox = function () {
                return this.path()
            };
            this.getMarkers = function () {
                return null
            }
        };
        b.Element.PathElementBase.prototype = new b.Element.RenderedElementBase;
        b.Element.svg = function (c) {
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            this.baseClearContext = this.clearContext;
            this.clearContext = function (a) {
                this.baseClearContext(a);
                b.ViewPort.RemoveCurrent()
            };
            this.baseSetContext = this.setContext;
            this.setContext = function (a) {
                a.strokeStyle = "rgba(0,0,0,0)";
                a.lineCap = "butt";
                a.lineJoin = "miter";
                a.miterLimit = 4;
                this.baseSetContext(a);
                this.attribute("x").hasValue() || (this.attribute("x", !0).value = 0);
                this.attribute("y").hasValue() || (this.attribute("y", !0).value = 0);
                a.translate(this.attribute("x").toPixels("x"), this.attribute("y").toPixels("y"));
                var d = b.ViewPort.width(), g = b.ViewPort.height();
                this.attribute("width").hasValue() || (this.attribute("width", !0).value = "100%");
                this.attribute("height").hasValue() || (this.attribute("height", !0).value = "100%");
                if ("undefined" == typeof this.root) {
                    var d = this.attribute("width").toPixels("x"), g = this.attribute("height").toPixels("y"), h = 0, c = 0;
                    this.attribute("refX").hasValue() && this.attribute("refY").hasValue() && (h = -this.attribute("refX").toPixels("x"), c = -this.attribute("refY").toPixels("y"));
                    a.beginPath();
                    a.moveTo(h, c);
                    a.lineTo(d, c);
                    a.lineTo(d, g);
                    a.lineTo(h, g);
                    a.closePath();
                    a.clip()
                }
                b.ViewPort.SetCurrent(d, g);
                if (this.attribute("viewBox").hasValue()) {
                    var h = b.ToNumberArray(this.attribute("viewBox").value), c = h[0], f = h[1], d = h[2], g =
                        h[3];
                    b.AspectRatio(a, this.attribute("preserveAspectRatio").value, b.ViewPort.width(), d, b.ViewPort.height(), g, c, f, this.attribute("refX").value, this.attribute("refY").value);
                    b.ViewPort.RemoveCurrent();
                    b.ViewPort.SetCurrent(h[2], h[3])
                }
            }
        };
        b.Element.svg.prototype = new b.Element.RenderedElementBase;
        b.Element.rect = function (c) {
            this.base = b.Element.PathElementBase;
            this.base(c);
            this.path = function (a) {
                var d = this.attribute("x").toPixels("x"), g = this.attribute("y").toPixels("y"), h = this.attribute("width").toPixels("x"),
                    c = this.attribute("height").toPixels("y"), f = this.attribute("rx").toPixels("x"), k = this.attribute("ry").toPixels("y");
                this.attribute("rx").hasValue() && !this.attribute("ry").hasValue() && (k = f);
                this.attribute("ry").hasValue() && !this.attribute("rx").hasValue() && (f = k);
                f = Math.min(f, h / 2);
                k = Math.min(k, c / 2);
                null != a && (a.beginPath(), a.moveTo(d + f, g), a.lineTo(d + h - f, g), a.quadraticCurveTo(d + h, g, d + h, g + k), a.lineTo(d + h, g + c - k), a.quadraticCurveTo(d + h, g + c, d + h - f, g + c), a.lineTo(d + f, g + c), a.quadraticCurveTo(d, g + c, d, g + c - k), a.lineTo(d,
                    g + k), a.quadraticCurveTo(d, g, d + f, g), a.closePath());
                return new b.BoundingBox(d, g, d + h, g + c)
            }
        };
        b.Element.rect.prototype = new b.Element.PathElementBase;
        b.Element.circle = function (c) {
            this.base = b.Element.PathElementBase;
            this.base(c);
            this.path = function (a) {
                var d = this.attribute("cx").toPixels("x"), g = this.attribute("cy").toPixels("y"), h = this.attribute("r").toPixels();
                null != a && (a.beginPath(), a.arc(d, g, h, 0, 2 * Math.PI, !0), a.closePath());
                return new b.BoundingBox(d - h, g - h, d + h, g + h)
            }
        };
        b.Element.circle.prototype = new b.Element.PathElementBase;
        b.Element.ellipse = function (c) {
            this.base = b.Element.PathElementBase;
            this.base(c);
            this.path = function (a) {
                var d = 4 * ((Math.sqrt(2) - 1) / 3), g = this.attribute("rx").toPixels("x"), h = this.attribute("ry").toPixels("y"), c = this.attribute("cx").toPixels("x"), f = this.attribute("cy").toPixels("y");
                null != a && (a.beginPath(), a.moveTo(c, f - h), a.bezierCurveTo(c + d * g, f - h, c + g, f - d * h, c + g, f), a.bezierCurveTo(c + g, f + d * h, c + d * g, f + h, c, f + h), a.bezierCurveTo(c - d * g, f + h, c - g, f + d * h, c - g, f), a.bezierCurveTo(c - g, f - d * h, c - d * g, f - h, c, f - h), a.closePath());
                return new b.BoundingBox(c - g, f - h, c + g, f + h)
            }
        };
        b.Element.ellipse.prototype = new b.Element.PathElementBase;
        b.Element.line = function (c) {
            this.base = b.Element.PathElementBase;
            this.base(c);
            this.getPoints = function () {
                return [new b.Point(this.attribute("x1").toPixels("x"), this.attribute("y1").toPixels("y")), new b.Point(this.attribute("x2").toPixels("x"), this.attribute("y2").toPixels("y"))]
            };
            this.path = function (a) {
                var d = this.getPoints();
                null != a && (a.beginPath(), a.moveTo(d[0].x, d[0].y), a.lineTo(d[1].x, d[1].y));
                return new b.BoundingBox(d[0].x,
                    d[0].y, d[1].x, d[1].y)
            };
            this.getMarkers = function () {
                var a = this.getPoints(), d = a[0].angleTo(a[1]);
                return [[a[0], d], [a[1], d]]
            }
        };
        b.Element.line.prototype = new b.Element.PathElementBase;
        b.Element.polyline = function (c) {
            this.base = b.Element.PathElementBase;
            this.base(c);
            this.points = b.CreatePath(this.attribute("points").value);
            this.path = function (a) {
                var d = new b.BoundingBox(this.points[0].x, this.points[0].y);
                null != a && (a.beginPath(), a.moveTo(this.points[0].x, this.points[0].y));
                for (var g = 1; g < this.points.length; g++)d.addPoint(this.points[g].x,
                    this.points[g].y), null != a && a.lineTo(this.points[g].x, this.points[g].y);
                return d
            };
            this.getMarkers = function () {
                for (var a = [], d = 0; d < this.points.length - 1; d++)a.push([this.points[d], this.points[d].angleTo(this.points[d + 1])]);
                a.push([this.points[this.points.length - 1], a[a.length - 1][1]]);
                return a
            }
        };
        b.Element.polyline.prototype = new b.Element.PathElementBase;
        b.Element.polygon = function (c) {
            this.base = b.Element.polyline;
            this.base(c);
            this.basePath = this.path;
            this.path = function (a) {
                var d = this.basePath(a);
                null != a && (a.lineTo(this.points[0].x,
                    this.points[0].y), a.closePath());
                return d
            }
        };
        b.Element.polygon.prototype = new b.Element.polyline;
        b.Element.path = function (c) {
            this.base = b.Element.PathElementBase;
            this.base(c);
            c = this.attribute("d").value;
            c = c.replace(/,/gm, " ");
            c = c.replace(/([MmZzLlHhVvCcSsQqTtAa])([MmZzLlHhVvCcSsQqTtAa])/gm, "$1 $2");
            c = c.replace(/([MmZzLlHhVvCcSsQqTtAa])([MmZzLlHhVvCcSsQqTtAa])/gm, "$1 $2");
            c = c.replace(/([MmZzLlHhVvCcSsQqTtAa])([^\s])/gm, "$1 $2");
            c = c.replace(/([^\s])([MmZzLlHhVvCcSsQqTtAa])/gm, "$1 $2");
            c = c.replace(/([0-9])([+\-])/gm,
                "$1 $2");
            c = c.replace(/(\.[0-9]*)(\.)/gm, "$1 $2");
            c = c.replace(/([Aa](\s+[0-9]+){3})\s+([01])\s*([01])/gm, "$1 $3 $4 ");
            c = b.compressSpaces(c);
            c = b.trim(c);
            this.PathParser = new function (a) {
                this.tokens = a.split(" ");
                this.reset = function () {
                    this.i = -1;
                    this.previousCommand = this.command = "";
                    this.start = new b.Point(0, 0);
                    this.control = new b.Point(0, 0);
                    this.current = new b.Point(0, 0);
                    this.points = [];
                    this.angles = []
                };
                this.isEnd = function () {
                    return this.i >= this.tokens.length - 1
                };
                this.isCommandOrEnd = function () {
                    return this.isEnd() ?
                        !0 : null != this.tokens[this.i + 1].match(/^[A-Za-z]$/)
                };
                this.isRelativeCommand = function () {
                    switch (this.command) {
                        case "m":
                        case "l":
                        case "h":
                        case "v":
                        case "c":
                        case "s":
                        case "q":
                        case "t":
                        case "a":
                        case "z":
                            return !0
                    }
                    return !1
                };
                this.getToken = function () {
                    this.i++;
                    return this.tokens[this.i]
                };
                this.getScalar = function () {
                    return parseFloat(this.getToken())
                };
                this.nextCommand = function () {
                    this.previousCommand = this.command;
                    this.command = this.getToken()
                };
                this.getPoint = function () {
                    var a = new b.Point(this.getScalar(), this.getScalar());
                    return this.makeAbsolute(a)
                };
                this.getAsControlPoint = function () {
                    var a = this.getPoint();
                    return this.control = a
                };
                this.getAsCurrentPoint = function () {
                    var a = this.getPoint();
                    return this.current = a
                };
                this.getReflectedControlPoint = function () {
                    return "c" != this.previousCommand.toLowerCase() && "s" != this.previousCommand.toLowerCase() && "q" != this.previousCommand.toLowerCase() && "t" != this.previousCommand.toLowerCase() ? this.current : new b.Point(2 * this.current.x - this.control.x, 2 * this.current.y - this.control.y)
                };
                this.makeAbsolute =
                    function (a) {
                        this.isRelativeCommand() && (a.x += this.current.x, a.y += this.current.y);
                        return a
                    };
                this.addMarker = function (a, b, c) {
                    null != c && 0 < this.angles.length && null == this.angles[this.angles.length - 1] && (this.angles[this.angles.length - 1] = this.points[this.points.length - 1].angleTo(c));
                    this.addMarkerAngle(a, null == b ? null : b.angleTo(a))
                };
                this.addMarkerAngle = function (a, b) {
                    this.points.push(a);
                    this.angles.push(b)
                };
                this.getMarkerPoints = function () {
                    return this.points
                };
                this.getMarkerAngles = function () {
                    for (var a = 0; a < this.angles.length; a++)if (null ==
                        this.angles[a])for (var b = a + 1; b < this.angles.length; b++)if (null != this.angles[b]) {
                        this.angles[a] = this.angles[b];
                        break
                    }
                    return this.angles
                }
            }(c);
            this.path = function (a) {
                var d = this.PathParser;
                d.reset();
                var g = new b.BoundingBox;
                for (null != a && a.beginPath(); !d.isEnd();)switch (d.nextCommand(), d.command) {
                    case "M":
                    case "m":
                        var c = d.getAsCurrentPoint();
                        d.addMarker(c);
                        g.addPoint(c.x, c.y);
                        null != a && a.moveTo(c.x, c.y);
                        for (d.start = d.current; !d.isCommandOrEnd();)c = d.getAsCurrentPoint(), d.addMarker(c, d.start), g.addPoint(c.x,
                            c.y), null != a && a.lineTo(c.x, c.y);
                        break;
                    case "L":
                    case "l":
                        for (; !d.isCommandOrEnd();) {
                            var l = d.current, c = d.getAsCurrentPoint();
                            d.addMarker(c, l);
                            g.addPoint(c.x, c.y);
                            null != a && a.lineTo(c.x, c.y)
                        }
                        break;
                    case "H":
                    case "h":
                        for (; !d.isCommandOrEnd();)c = new b.Point((d.isRelativeCommand() ? d.current.x : 0) + d.getScalar(), d.current.y), d.addMarker(c, d.current), d.current = c, g.addPoint(d.current.x, d.current.y), null != a && a.lineTo(d.current.x, d.current.y);
                        break;
                    case "V":
                    case "v":
                        for (; !d.isCommandOrEnd();)c = new b.Point(d.current.x,
                            (d.isRelativeCommand() ? d.current.y : 0) + d.getScalar()), d.addMarker(c, d.current), d.current = c, g.addPoint(d.current.x, d.current.y), null != a && a.lineTo(d.current.x, d.current.y);
                        break;
                    case "C":
                    case "c":
                        for (; !d.isCommandOrEnd();) {
                            var f = d.current, l = d.getPoint(), k = d.getAsControlPoint(), c = d.getAsCurrentPoint();
                            d.addMarker(c, k, l);
                            g.addBezierCurve(f.x, f.y, l.x, l.y, k.x, k.y, c.x, c.y);
                            null != a && a.bezierCurveTo(l.x, l.y, k.x, k.y, c.x, c.y)
                        }
                        break;
                    case "S":
                    case "s":
                        for (; !d.isCommandOrEnd();)f = d.current, l = d.getReflectedControlPoint(),
                            k = d.getAsControlPoint(), c = d.getAsCurrentPoint(), d.addMarker(c, k, l), g.addBezierCurve(f.x, f.y, l.x, l.y, k.x, k.y, c.x, c.y), null != a && a.bezierCurveTo(l.x, l.y, k.x, k.y, c.x, c.y);
                        break;
                    case "Q":
                    case "q":
                        for (; !d.isCommandOrEnd();)f = d.current, k = d.getAsControlPoint(), c = d.getAsCurrentPoint(), d.addMarker(c, k, k), g.addQuadraticCurve(f.x, f.y, k.x, k.y, c.x, c.y), null != a && a.quadraticCurveTo(k.x, k.y, c.x, c.y);
                        break;
                    case "T":
                    case "t":
                        for (; !d.isCommandOrEnd();)f = d.current, k = d.getReflectedControlPoint(), d.control = k, c = d.getAsCurrentPoint(),
                            d.addMarker(c, k, k), g.addQuadraticCurve(f.x, f.y, k.x, k.y, c.x, c.y), null != a && a.quadraticCurveTo(k.x, k.y, c.x, c.y);
                        break;
                    case "A":
                    case "a":
                        for (; !d.isCommandOrEnd();) {
                            var f = d.current, e = d.getScalar(), n = d.getScalar(), l = d.getScalar() * (Math.PI / 180), m = d.getScalar(), k = d.getScalar(), c = d.getAsCurrentPoint(), q = new b.Point(Math.cos(l) * (f.x - c.x) / 2 + Math.sin(l) * (f.y - c.y) / 2, -Math.sin(l) * (f.x - c.x) / 2 + Math.cos(l) * (f.y - c.y) / 2), u = Math.pow(q.x, 2) / Math.pow(e, 2) + Math.pow(q.y, 2) / Math.pow(n, 2);
                            1 < u && (e *= Math.sqrt(u), n *= Math.sqrt(u));
                            m = (m == k ? -1 : 1) * Math.sqrt((Math.pow(e, 2) * Math.pow(n, 2) - Math.pow(e, 2) * Math.pow(q.y, 2) - Math.pow(n, 2) * Math.pow(q.x, 2)) / (Math.pow(e, 2) * Math.pow(q.y, 2) + Math.pow(n, 2) * Math.pow(q.x, 2)));
                            isNaN(m) && (m = 0);
                            var v = new b.Point(m * e * q.y / n, m * -n * q.x / e), f = new b.Point((f.x + c.x) / 2 + Math.cos(l) * v.x - Math.sin(l) * v.y, (f.y + c.y) / 2 + Math.sin(l) * v.x + Math.cos(l) * v.y), A = function (a) {
                                return Math.sqrt(Math.pow(a[0], 2) + Math.pow(a[1], 2))
                            }, x = function (a, d) {
                                return (a[0] * d[0] + a[1] * d[1]) / (A(a) * A(d))
                            }, z = function (a, d) {
                                return (a[0] * d[1] < a[1] * d[0] ?
                                        -1 : 1) * Math.acos(x(a, d))
                            }, m = z([1, 0], [(q.x - v.x) / e, (q.y - v.y) / n]), u = [(q.x - v.x) / e, (q.y - v.y) / n], v = [(-q.x - v.x) / e, (-q.y - v.y) / n], q = z(u, v);
                            -1 >= x(u, v) && (q = Math.PI);
                            1 <= x(u, v) && (q = 0);
                            u = 1 - k ? 1 : -1;
                            v = m + q / 2 * u;
                            z = new b.Point(f.x + e * Math.cos(v), f.y + n * Math.sin(v));
                            d.addMarkerAngle(z, v - u * Math.PI / 2);
                            d.addMarkerAngle(c, v - u * Math.PI);
                            g.addPoint(c.x, c.y);
                            null != a && (x = e > n ? e : n, c = e > n ? 1 : e / n, e = e > n ? n / e : 1, a.translate(f.x, f.y), a.rotate(l), a.scale(c, e), a.arc(0, 0, x, m, m + q, 1 - k), a.scale(1 / c, 1 / e), a.rotate(-l), a.translate(-f.x, -f.y))
                        }
                        break;
                    case "Z":
                    case "z":
                        null != a && a.closePath(), d.current = d.start
                }
                return g
            };
            this.getMarkers = function () {
                for (var a = this.PathParser.getMarkerPoints(), d = this.PathParser.getMarkerAngles(), b = [], c = 0; c < a.length; c++)b.push([a[c], d[c]]);
                return b
            }
        };
        b.Element.path.prototype = new b.Element.PathElementBase;
        b.Element.pattern = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.createPattern = function (a, d) {
                var c = this.attribute("width").toPixels("x", !0), h = this.attribute("height").toPixels("y", !0), e = new b.Element.svg;
                e.attributes.viewBox = new b.Property("viewBox", this.attribute("viewBox").value);
                e.attributes.width = new b.Property("width", c + "px");
                e.attributes.height = new b.Property("height", h + "px");
                e.attributes.transform = new b.Property("transform", this.attribute("patternTransform").value);
                e.children = this.children;
                var f = document.createElement("canvas");
                f.width = c;
                f.height = h;
                c = f.getContext("2d");
                this.attribute("x").hasValue() && this.attribute("y").hasValue() && c.translate(this.attribute("x").toPixels("x", !0), this.attribute("y").toPixels("y",
                    !0));
                for (h = -1; 1 >= h; h++)for (var k = -1; 1 >= k; k++)c.save(), c.translate(h * f.width, k * f.height), e.render(c), c.restore();
                return a.createPattern(f, "repeat")
            }
        };
        b.Element.pattern.prototype = new b.Element.ElementBase;
        b.Element.marker = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.baseRender = this.render;
            this.render = function (a, d, c) {
                a.translate(d.x, d.y);
                "auto" == this.attribute("orient").valueOrDefault("auto") && a.rotate(c);
                "strokeWidth" == this.attribute("markerUnits").valueOrDefault("strokeWidth") && a.scale(a.lineWidth,
                    a.lineWidth);
                a.save();
                var h = new b.Element.svg;
                h.attributes.viewBox = new b.Property("viewBox", this.attribute("viewBox").value);
                h.attributes.refX = new b.Property("refX", this.attribute("refX").value);
                h.attributes.refY = new b.Property("refY", this.attribute("refY").value);
                h.attributes.width = new b.Property("width", this.attribute("markerWidth").value);
                h.attributes.height = new b.Property("height", this.attribute("markerHeight").value);
                h.attributes.fill = new b.Property("fill", this.attribute("fill").valueOrDefault("black"));
                h.attributes.stroke = new b.Property("stroke", this.attribute("stroke").valueOrDefault("none"));
                h.children = this.children;
                h.render(a);
                a.restore();
                "strokeWidth" == this.attribute("markerUnits").valueOrDefault("strokeWidth") && a.scale(1 / a.lineWidth, 1 / a.lineWidth);
                "auto" == this.attribute("orient").valueOrDefault("auto") && a.rotate(-c);
                a.translate(-d.x, -d.y)
            }
        };
        b.Element.marker.prototype = new b.Element.ElementBase;
        b.Element.defs = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.render = function (a) {
            }
        };
        b.Element.defs.prototype = new b.Element.ElementBase;
        b.Element.GradientBase = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.gradientUnits = this.attribute("gradientUnits").valueOrDefault("objectBoundingBox");
            this.stops = [];
            for (c = 0; c < this.children.length; c++) {
                var a = this.children[c];
                "stop" == a.type && this.stops.push(a)
            }
            this.getGradient = function () {
            };
            this.createGradient = function (a, c, h) {
                var e = this;
                this.getHrefAttribute().hasValue() && (e = this.getHrefAttribute().getDefinition());
                var f = function (a) {
                    return h.hasValue() ?
                        (new b.Property("color", a)).addOpacity(h.value).value : a
                };
                a = this.getGradient(a, c);
                if (null == a)return f(e.stops[e.stops.length - 1].color);
                for (c = 0; c < e.stops.length; c++)a.addColorStop(e.stops[c].offset, f(e.stops[c].color));
                return this.attribute("gradientTransform").hasValue() ? (e = b.ViewPort.viewPorts[0], f = new b.Element.rect, f.attributes.x = new b.Property("x", -b.MAX_VIRTUAL_PIXELS / 3), f.attributes.y = new b.Property("y", -b.MAX_VIRTUAL_PIXELS / 3), f.attributes.width = new b.Property("width", b.MAX_VIRTUAL_PIXELS),
                    f.attributes.height = new b.Property("height", b.MAX_VIRTUAL_PIXELS), c = new b.Element.g, c.attributes.transform = new b.Property("transform", this.attribute("gradientTransform").value), c.children = [f], f = new b.Element.svg, f.attributes.x = new b.Property("x", 0), f.attributes.y = new b.Property("y", 0), f.attributes.width = new b.Property("width", e.width), f.attributes.height = new b.Property("height", e.height), f.children = [c], c = document.createElement("canvas"), c.width = e.width, c.height = e.height, e = c.getContext("2d"), e.fillStyle =
                    a, f.render(e), e.createPattern(c, "no-repeat")) : a
            }
        };
        b.Element.GradientBase.prototype = new b.Element.ElementBase;
        b.Element.linearGradient = function (c) {
            this.base = b.Element.GradientBase;
            this.base(c);
            this.getGradient = function (a, d) {
                var b = d.getBoundingBox();
                this.attribute("x1").hasValue() || this.attribute("y1").hasValue() || this.attribute("x2").hasValue() || this.attribute("y2").hasValue() || (this.attribute("x1", !0).value = 0, this.attribute("y1", !0).value = 0, this.attribute("x2", !0).value = 1, this.attribute("y2", !0).value =
                    0);
                var c = "objectBoundingBox" == this.gradientUnits ? b.x() + b.width() * this.attribute("x1").numValue() : this.attribute("x1").toPixels("x"), e = "objectBoundingBox" == this.gradientUnits ? b.y() + b.height() * this.attribute("y1").numValue() : this.attribute("y1").toPixels("y"), f = "objectBoundingBox" == this.gradientUnits ? b.x() + b.width() * this.attribute("x2").numValue() : this.attribute("x2").toPixels("x"), b = "objectBoundingBox" == this.gradientUnits ? b.y() + b.height() * this.attribute("y2").numValue() : this.attribute("y2").toPixels("y");
                return c == f && e == b ? null : a.createLinearGradient(c, e, f, b)
            }
        };
        b.Element.linearGradient.prototype = new b.Element.GradientBase;
        b.Element.radialGradient = function (c) {
            this.base = b.Element.GradientBase;
            this.base(c);
            this.getGradient = function (a, d) {
                var b = d.getBoundingBox();
                this.attribute("cx").hasValue() || (this.attribute("cx", !0).value = "50%");
                this.attribute("cy").hasValue() || (this.attribute("cy", !0).value = "50%");
                this.attribute("r").hasValue() || (this.attribute("r", !0).value = "50%");
                var c = "objectBoundingBox" == this.gradientUnits ?
                b.x() + b.width() * this.attribute("cx").numValue() : this.attribute("cx").toPixels("x"), e = "objectBoundingBox" == this.gradientUnits ? b.y() + b.height() * this.attribute("cy").numValue() : this.attribute("cy").toPixels("y"), f = c, k = e;
                this.attribute("fx").hasValue() && (f = "objectBoundingBox" == this.gradientUnits ? b.x() + b.width() * this.attribute("fx").numValue() : this.attribute("fx").toPixels("x"));
                this.attribute("fy").hasValue() && (k = "objectBoundingBox" == this.gradientUnits ? b.y() + b.height() * this.attribute("fy").numValue() :
                    this.attribute("fy").toPixels("y"));
                b = "objectBoundingBox" == this.gradientUnits ? (b.width() + b.height()) / 2 * this.attribute("r").numValue() : this.attribute("r").toPixels();
                return a.createRadialGradient(f, k, 0, c, e, b)
            }
        };
        b.Element.radialGradient.prototype = new b.Element.GradientBase;
        b.Element.stop = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.offset = this.attribute("offset").numValue();
            0 > this.offset && (this.offset = 0);
            1 < this.offset && (this.offset = 1);
            c = this.style("stop-color");
            this.style("stop-opacity").hasValue() &&
            (c = c.addOpacity(this.style("stop-opacity").value));
            this.color = c.value
        };
        b.Element.stop.prototype = new b.Element.ElementBase;
        b.Element.AnimateBase = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            b.Animations.push(this);
            this.duration = 0;
            this.begin = this.attribute("begin").toMilliseconds();
            this.maxDuration = this.begin + this.attribute("dur").toMilliseconds();
            this.getProperty = function () {
                var a = this.attribute("attributeType").value, d = this.attribute("attributeName").value;
                return "CSS" == a ? this.parent.style(d,
                    !0) : this.parent.attribute(d, !0)
            };
            this.initialValue = null;
            this.initialUnits = "";
            this.removed = !1;
            this.calcValue = function () {
                return ""
            };
            this.update = function (a) {
                null == this.initialValue && (this.initialValue = this.getProperty().value, this.initialUnits = this.getProperty().getUnits());
                if (this.duration > this.maxDuration)if ("indefinite" == this.attribute("repeatCount").value || "indefinite" == this.attribute("repeatDur").value)this.duration = 0; else {
                    if ("remove" != this.attribute("fill").valueOrDefault("remove") || this.removed)return !1;
                    this.removed = !0;
                    this.getProperty().value = this.initialValue;
                    return !0
                }
                this.duration += a;
                a = !1;
                this.begin < this.duration && (a = this.calcValue(), this.attribute("type").hasValue() && (a = this.attribute("type").value + "(" + a + ")"), this.getProperty().value = a, a = !0);
                return a
            };
            this.from = this.attribute("from");
            this.to = this.attribute("to");
            this.values = this.attribute("values");
            this.values.hasValue() && (this.values.value = this.values.value.split(";"));
            this.progress = function () {
                var a = {
                    progress: (this.duration - this.begin) / (this.maxDuration -
                    this.begin)
                };
                if (this.values.hasValue()) {
                    var d = a.progress * (this.values.value.length - 1), c = Math.floor(d), h = Math.ceil(d);
                    a.from = new b.Property("from", parseFloat(this.values.value[c]));
                    a.to = new b.Property("to", parseFloat(this.values.value[h]));
                    a.progress = (d - c) / (h - c)
                } else a.from = this.from, a.to = this.to;
                return a
            }
        };
        b.Element.AnimateBase.prototype = new b.Element.ElementBase;
        b.Element.animate = function (c) {
            this.base = b.Element.AnimateBase;
            this.base(c);
            this.calcValue = function () {
                var a = this.progress();
                return a.from.numValue() +
                    (a.to.numValue() - a.from.numValue()) * a.progress + this.initialUnits
            }
        };
        b.Element.animate.prototype = new b.Element.AnimateBase;
        b.Element.animateColor = function (c) {
            this.base = b.Element.AnimateBase;
            this.base(c);
            this.calcValue = function () {
                var a = this.progress(), d = new RGBColor(a.from.value), b = new RGBColor(a.to.value);
                if (d.ok && b.ok) {
                    var c = d.g + (b.g - d.g) * a.progress, e = d.b + (b.b - d.b) * a.progress;
                    return "rgb(" + parseInt(d.r + (b.r - d.r) * a.progress, 10) + "," + parseInt(c, 10) + "," + parseInt(e, 10) + ")"
                }
                return this.attribute("from").value
            }
        };
        b.Element.animateColor.prototype = new b.Element.AnimateBase;
        b.Element.animateTransform = function (c) {
            this.base = b.Element.AnimateBase;
            this.base(c);
            this.calcValue = function () {
                for (var a = this.progress(), d = b.ToNumberArray(a.from.value), c = b.ToNumberArray(a.to.value), h = "", e = 0; e < d.length; e++)h += d[e] + (c[e] - d[e]) * a.progress + " ";
                return h
            }
        };
        b.Element.animateTransform.prototype = new b.Element.animate;
        b.Element.font = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.horizAdvX = this.attribute("horiz-adv-x").numValue();
            this.isArabic = this.isRTL = !1;
            this.missingGlyph = this.fontFace = null;
            this.glyphs = [];
            for (c = 0; c < this.children.length; c++) {
                var a = this.children[c];
                "font-face" == a.type ? (this.fontFace = a, a.style("font-family").hasValue() && (b.Definitions[a.style("font-family").value] = this)) : "missing-glyph" == a.type ? this.missingGlyph = a : "glyph" == a.type && ("" != a.arabicForm ? (this.isArabic = this.isRTL = !0, "undefined" == typeof this.glyphs[a.unicode] && (this.glyphs[a.unicode] = []), this.glyphs[a.unicode][a.arabicForm] = a) : this.glyphs[a.unicode] =
                    a)
            }
        };
        b.Element.font.prototype = new b.Element.ElementBase;
        b.Element.fontface = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.ascent = this.attribute("ascent").value;
            this.descent = this.attribute("descent").value;
            this.unitsPerEm = this.attribute("units-per-em").numValue()
        };
        b.Element.fontface.prototype = new b.Element.ElementBase;
        b.Element.missingglyph = function (c) {
            this.base = b.Element.path;
            this.base(c);
            this.horizAdvX = 0
        };
        b.Element.missingglyph.prototype = new b.Element.path;
        b.Element.glyph = function (c) {
            this.base =
                b.Element.path;
            this.base(c);
            this.horizAdvX = this.attribute("horiz-adv-x").numValue();
            this.unicode = this.attribute("unicode").value;
            this.arabicForm = this.attribute("arabic-form").value
        };
        b.Element.glyph.prototype = new b.Element.path;
        b.Element.text = function (c) {
            this.captureTextNodes = !0;
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            this.baseSetContext = this.setContext;
            this.setContext = function (a) {
                this.baseSetContext(a);
                this.style("dominant-baseline").hasValue() && (a.textBaseline = this.style("dominant-baseline").value);
                this.style("alignment-baseline").hasValue() && (a.textBaseline = this.style("alignment-baseline").value)
            };
            this.getBoundingBox = function () {
                return new b.BoundingBox(this.attribute("x").toPixels("x"), this.attribute("y").toPixels("y"), 0, 0)
            };
            this.renderChildren = function (a) {
                this.x = this.attribute("x").toPixels("x");
                this.y = this.attribute("y").toPixels("y");
                this.x += this.getAnchorDelta(a, this, 0);
                for (var d = 0; d < this.children.length; d++)this.renderChild(a, this, d)
            };
            this.getAnchorDelta = function (a, d, b) {
                var c = this.style("text-anchor").valueOrDefault("start");
                if ("start" != c) {
                    for (var e = 0, f = b; f < d.children.length; f++) {
                        var k = d.children[f];
                        if (f > b && k.attribute("x").hasValue())break;
                        e += k.measureTextRecursive(a)
                    }
                    return -1 * ("end" == c ? e : e / 2)
                }
                return 0
            };
            this.renderChild = function (a, b, c) {
                var h = b.children[c];
                h.attribute("x").hasValue() ? h.x = h.attribute("x").toPixels("x") + this.getAnchorDelta(a, b, c) : (this.attribute("dx").hasValue() && (this.x += this.attribute("dx").toPixels("x")), h.attribute("dx").hasValue() && (this.x += h.attribute("dx").toPixels("x")), h.x = this.x);
                this.x = h.x + h.measureText(a);
                h.attribute("y").hasValue() ? h.y = h.attribute("y").toPixels("y") : (this.attribute("dy").hasValue() && (this.y += this.attribute("dy").toPixels("y")), h.attribute("dy").hasValue() && (this.y += h.attribute("dy").toPixels("y")), h.y = this.y);
                this.y = h.y;
                h.render(a);
                for (c = 0; c < h.children.length; c++)this.renderChild(a, h, c)
            }
        };
        b.Element.text.prototype = new b.Element.RenderedElementBase;
        b.Element.TextElementBase = function (c) {
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            this.getGlyph = function (a, b, c) {
                var h = b[c], e = null;
                if (a.isArabic) {
                    var f = "isolated";
                    (0 == c || " " == b[c - 1]) && c < b.length - 2 && " " != b[c + 1] && (f = "terminal");
                    0 < c && " " != b[c - 1] && c < b.length - 2 && " " != b[c + 1] && (f = "medial");
                    0 < c && " " != b[c - 1] && (c == b.length - 1 || " " == b[c + 1]) && (f = "initial");
                    "undefined" != typeof a.glyphs[h] && (e = a.glyphs[h][f], null == e && "glyph" == a.glyphs[h].type && (e = a.glyphs[h]))
                } else e = a.glyphs[h];
                null == e && (e = a.missingGlyph);
                return e
            };
            this.renderChildren = function (a) {
                var d = this.parent.style("font-family").getDefinition();
                if (null != d) {
                    var c = this.parent.style("font-size").numValueOrDefault(b.Font.Parse(b.ctx.font).fontSize),
                        h = this.parent.style("font-style").valueOrDefault(b.Font.Parse(b.ctx.font).fontStyle), e = this.getText();
                    d.isRTL && (e = e.split("").reverse().join(""));
                    for (var f = b.ToNumberArray(this.parent.attribute("dx").value), k = 0; k < e.length; k++) {
                        var p = this.getGlyph(d, e, k), n = c / d.fontFace.unitsPerEm;
                        a.translate(this.x, this.y);
                        a.scale(n, -n);
                        var m = a.lineWidth;
                        a.lineWidth = a.lineWidth * d.fontFace.unitsPerEm / c;
                        "italic" == h && a.transform(1, 0, .4, 1, 0, 0);
                        p.render(a);
                        "italic" == h && a.transform(1, 0, -.4, 1, 0, 0);
                        a.lineWidth = m;
                        a.scale(1 /
                        n, -1 / n);
                        a.translate(-this.x, -this.y);
                        this.x += c * (p.horizAdvX || d.horizAdvX) / d.fontFace.unitsPerEm;
                        "undefined" == typeof f[k] || isNaN(f[k]) || (this.x += f[k])
                    }
                } else"" != a.fillStyle && a.fillText(b.compressSpaces(this.getText()), this.x, this.y), "" != a.strokeStyle && a.strokeText(b.compressSpaces(this.getText()), this.x, this.y)
            };
            this.getText = function () {
            };
            this.measureTextRecursive = function (a) {
                for (var b = this.measureText(a), c = 0; c < this.children.length; c++)b += this.children[c].measureTextRecursive(a);
                return b
            };
            this.measureText =
                function (a) {
                    var d = this.parent.style("font-family").getDefinition();
                    if (null != d) {
                        a = this.parent.style("font-size").numValueOrDefault(b.Font.Parse(b.ctx.font).fontSize);
                        var c = 0, h = this.getText();
                        d.isRTL && (h = h.split("").reverse().join(""));
                        for (var e = b.ToNumberArray(this.parent.attribute("dx").value), f = 0; f < h.length; f++) {
                            var k = this.getGlyph(d, h, f), c = c + (k.horizAdvX || d.horizAdvX) * a / d.fontFace.unitsPerEm;
                            "undefined" == typeof e[f] || isNaN(e[f]) || (c += e[f])
                        }
                        return c
                    }
                    d = b.compressSpaces(this.getText());
                    if (!a.measureText)return 10 *
                        d.length;
                    a.save();
                    this.setContext(a);
                    d = a.measureText(d).width;
                    a.restore();
                    return d
                }
        };
        b.Element.TextElementBase.prototype = new b.Element.RenderedElementBase;
        b.Element.tspan = function (c) {
            this.captureTextNodes = !0;
            this.base = b.Element.TextElementBase;
            this.base(c);
            this.text = c.nodeValue || c.text || "";
            this.getText = function () {
                return this.text
            }
        };
        b.Element.tspan.prototype = new b.Element.TextElementBase;
        b.Element.tref = function (c) {
            this.base = b.Element.TextElementBase;
            this.base(c);
            this.getText = function () {
                var a = this.getHrefAttribute().getDefinition();
                if (null != a)return a.children[0].getText()
            }
        };
        b.Element.tref.prototype = new b.Element.TextElementBase;
        b.Element.a = function (c) {
            this.base = b.Element.TextElementBase;
            this.base(c);
            this.hasText = !0;
            for (var a = 0; a < c.childNodes.length; a++)3 != c.childNodes[a].nodeType && (this.hasText = !1);
            this.text = this.hasText ? c.childNodes[0].nodeValue : "";
            this.getText = function () {
                return this.text
            };
            this.baseRenderChildren = this.renderChildren;
            this.renderChildren = function (a) {
                if (this.hasText) {
                    this.baseRenderChildren(a);
                    var c = new b.Property("fontSize",
                        b.Font.Parse(b.ctx.font).fontSize);
                    b.Mouse.checkBoundingBox(this, new b.BoundingBox(this.x, this.y - c.toPixels("y"), this.x + this.measureText(a), this.y))
                } else c = new b.Element.g, c.children = this.children, c.parent = this, c.render(a)
            };
            this.onclick = function () {
                window.open(this.getHrefAttribute().value)
            };
            this.onmousemove = function () {
                b.ctx.canvas.style.cursor = "pointer"
            }
        };
        b.Element.a.prototype = new b.Element.TextElementBase;
        b.Element.image = function (c) {
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            var a = this.getHrefAttribute().value,
                d = a.match(/\.svg$/);
            b.Images.push(this);
            this.loaded = !1;
            if (d)this.img = b.ajax(a), this.loaded = !0; else {
                this.img = document.createElement("img");
                var g = this;
                this.img.onload = function () {
                    g.loaded = !0
                };
                this.img.onerror = function () {
                    "undefined" != typeof console && (console.log('ERROR: image "' + a + '" not found'), g.loaded = !0)
                };
                this.img.src = a
            }
            this.renderChildren = function (a) {
                var c = this.attribute("x").toPixels("x"), g = this.attribute("y").toPixels("y"), e = this.attribute("width").toPixels("x"), p = this.attribute("height").toPixels("y");
                0 != e && 0 != p && (a.save(), d ? a.drawSvg(this.img, c, g, e, p) : (a.translate(c, g), b.AspectRatio(a, this.attribute("preserveAspectRatio").value, e, this.img.width, p, this.img.height, 0, 0), a.drawImage(this.img, 0, 0)), a.restore())
            };
            this.getBoundingBox = function () {
                var a = this.attribute("x").toPixels("x"), d = this.attribute("y").toPixels("y"), c = this.attribute("width").toPixels("x"), g = this.attribute("height").toPixels("y");
                return new b.BoundingBox(a, d, a + c, d + g)
            }
        };
        b.Element.image.prototype = new b.Element.RenderedElementBase;
        b.Element.g =
            function (c) {
                this.base = b.Element.RenderedElementBase;
                this.base(c);
                this.getBoundingBox = function () {
                    for (var a = new b.BoundingBox, d = 0; d < this.children.length; d++)a.addBoundingBox(this.children[d].getBoundingBox());
                    return a
                }
            };
        b.Element.g.prototype = new b.Element.RenderedElementBase;
        b.Element.symbol = function (c) {
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            this.baseSetContext = this.setContext;
            this.setContext = function (a) {
                this.baseSetContext(a);
                if (this.attribute("viewBox").hasValue()) {
                    var d = b.ToNumberArray(this.attribute("viewBox").value),
                        c = d[0], e = d[1];
                    width = d[2];
                    height = d[3];
                    b.AspectRatio(a, this.attribute("preserveAspectRatio").value, this.attribute("width").toPixels("x"), width, this.attribute("height").toPixels("y"), height, c, e);
                    b.ViewPort.SetCurrent(d[2], d[3])
                }
            }
        };
        b.Element.symbol.prototype = new b.Element.RenderedElementBase;
        b.Element.style = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            for (var a = "", d = 0; d < c.childNodes.length; d++)a += c.childNodes[d].nodeValue;
            a = a.replace(/(\/\*([^*]|[\r\n]|(\*+([^*\/]|[\r\n])))*\*+\/)|(^[\s]*\/\/.*)/gm,
                "");
            a = b.compressSpaces(a);
            c = a.split("}");
            for (d = 0; d < c.length; d++)if ("" != b.trim(c[d]))for (var g = c[d].split("{"), a = g[0].split(","), g = g[1].split(";"), e = 0; e < a.length; e++) {
                var l = b.trim(a[e]);
                if ("" != l) {
                    for (var f = {}, k = 0; k < g.length; k++) {
                        var p = g[k].indexOf(":"), n = g[k].substr(0, p), p = g[k].substr(p + 1, g[k].length - p);
                        null != n && null != p && (f[b.trim(n)] = new b.Property(b.trim(n), b.trim(p)))
                    }
                    b.Styles[l] = f;
                    if ("@font-face" == l)for (l = f["font-family"].value.replace(/"/g, ""), f = f.src.value.split(","), k = 0; k < f.length; k++)if (0 <
                        f[k].indexOf('format("svg")'))for (n = f[k].indexOf("url"), p = f[k].indexOf(")", n), n = f[k].substr(n + 5, p - n - 6), n = b.parseXml(b.ajax(n)).getElementsByTagName("font"), p = 0; p < n.length; p++) {
                        var m = b.CreateElement(n[p]);
                        b.Definitions[l] = m
                    }
                }
            }
        };
        b.Element.style.prototype = new b.Element.ElementBase;
        b.Element.use = function (c) {
            this.base = b.Element.RenderedElementBase;
            this.base(c);
            this.baseSetContext = this.setContext;
            this.setContext = function (a) {
                this.baseSetContext(a);
                this.attribute("x").hasValue() && a.translate(this.attribute("x").toPixels("x"),
                    0);
                this.attribute("y").hasValue() && a.translate(0, this.attribute("y").toPixels("y"))
            };
            this.getDefinition = function () {
                var a = this.getHrefAttribute().getDefinition();
                this.attribute("width").hasValue() && (a.attribute("width", !0).value = this.attribute("width").value);
                this.attribute("height").hasValue() && (a.attribute("height", !0).value = this.attribute("height").value);
                return a
            };
            this.path = function (a) {
                var b = this.getDefinition();
                null != b && b.path(a)
            };
            this.getBoundingBox = function () {
                var a = this.getDefinition();
                if (null !=
                    a)return a.getBoundingBox()
            };
            this.renderChildren = function (a) {
                var b = this.getDefinition();
                if (null != b) {
                    var c = b.parent;
                    b.parent = null;
                    b.render(a);
                    b.parent = c
                }
            }
        };
        b.Element.use.prototype = new b.Element.RenderedElementBase;
        b.Element.mask = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.apply = function (a, d) {
                var c = this.attribute("x").toPixels("x"), e = this.attribute("y").toPixels("y"), l = this.attribute("width").toPixels("x"), f = this.attribute("height").toPixels("y");
                if (0 == l && 0 == f) {
                    f = new b.BoundingBox;
                    for (c = 0; c < this.children.length; c++)f.addBoundingBox(this.children[c].getBoundingBox());
                    c = Math.floor(f.x1);
                    e = Math.floor(f.y1);
                    l = Math.floor(f.width());
                    f = Math.floor(f.height())
                }
                var k = d.attribute("mask").value;
                d.attribute("mask").value = "";
                var p = document.createElement("canvas");
                p.width = c + l;
                p.height = e + f;
                var n = p.getContext("2d");
                this.renderChildren(n);
                var m = document.createElement("canvas");
                m.width = c + l;
                m.height = e + f;
                var q = m.getContext("2d");
                d.render(q);
                q.globalCompositeOperation = "destination-in";
                q.fillStyle =
                    n.createPattern(p, "no-repeat");
                q.fillRect(0, 0, c + l, e + f);
                a.fillStyle = q.createPattern(m, "no-repeat");
                a.fillRect(0, 0, c + l, e + f);
                d.attribute("mask").value = k
            };
            this.render = function (a) {
            }
        };
        b.Element.mask.prototype = new b.Element.ElementBase;
        b.Element.clipPath = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.apply = function (a) {
                for (var d = 0; d < this.children.length; d++) {
                    var c = this.children[d];
                    if ("undefined" != typeof c.path) {
                        var e = null;
                        c.attribute("transform").hasValue() && (e = new b.Transform(c.attribute("transform").value),
                            e.apply(a));
                        c.path(a);
                        a.clip();
                        e && e.unapply(a)
                    }
                }
            };
            this.render = function (a) {
            }
        };
        b.Element.clipPath.prototype = new b.Element.ElementBase;
        b.Element.filter = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.apply = function (a, b) {
                var c = b.getBoundingBox(), e = Math.floor(c.x1), l = Math.floor(c.y1), f = Math.floor(c.width()), c = Math.floor(c.height()), k = b.style("filter").value;
                b.style("filter").value = "";
                for (var p = 0, n = 0, m = 0; m < this.children.length; m++)var q = this.children[m].extraFilterDistance || 0, p = Math.max(p,
                    q), n = Math.max(n, q);
                q = document.createElement("canvas");
                q.width = f + 2 * p;
                q.height = c + 2 * n;
                var u = q.getContext("2d");
                u.translate(-e + p, -l + n);
                b.render(u);
                for (m = 0; m < this.children.length; m++)this.children[m].apply(u, 0, 0, f + 2 * p, c + 2 * n);
                a.drawImage(q, 0, 0, f + 2 * p, c + 2 * n, e - p, l - n, f + 2 * p, c + 2 * n);
                b.style("filter", !0).value = k
            };
            this.render = function (a) {
            }
        };
        b.Element.filter.prototype = new b.Element.ElementBase;
        b.Element.feMorphology = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.apply = function (a, b, c, e, l) {
            }
        };
        b.Element.feMorphology.prototype =
            new b.Element.ElementBase;
        b.Element.feColorMatrix = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.apply = function (a, b, c, e, l) {
                var f = a.getImageData(0, 0, e, l);
                for (c = 0; c < l; c++)for (b = 0; b < e; b++) {
                    var k = (f.data[c * e * 4 + 4 * b + 0] + f.data[c * e * 4 + 4 * b + 1] + f.data[c * e * 4 + 4 * b + 2]) / 3;
                    f.data[c * e * 4 + 4 * b + 0] = k;
                    f.data[c * e * 4 + 4 * b + 1] = k;
                    f.data[c * e * 4 + 4 * b + 2] = k
                }
                a.clearRect(0, 0, e, l);
                a.putImageData(f, 0, 0)
            }
        };
        b.Element.feColorMatrix.prototype = new b.Element.ElementBase;
        b.Element.feGaussianBlur = function (c) {
            this.base = b.Element.ElementBase;
            this.base(c);
            this.extraFilterDistance = this.blurRadius = Math.floor(this.attribute("stdDeviation").numValue());
            this.apply = function (a, d, c, e, l) {
                "undefined" == typeof stackBlurCanvasRGBA ? "undefined" != typeof console && console.log("ERROR: StackBlur.js must be included for blur to work") : (a.canvas.id = b.UniqueId(), a.canvas.style.display = "none", document.body.appendChild(a.canvas), stackBlurCanvasRGBA(a.canvas.id, d, c, e, l, this.blurRadius), document.body.removeChild(a.canvas))
            }
        };
        b.Element.feGaussianBlur.prototype = new b.Element.ElementBase;
        b.Element.title = function (b) {
        };
        b.Element.title.prototype = new b.Element.ElementBase;
        b.Element.desc = function (b) {
        };
        b.Element.desc.prototype = new b.Element.ElementBase;
        b.Element.MISSING = function (b) {
            "undefined" != typeof console && console.log("ERROR: Element '" + b.nodeName + "' not yet implemented.")
        };
        b.Element.MISSING.prototype = new b.Element.ElementBase;
        b.CreateElement = function (c) {
            var a = c.nodeName.replace(/^[^:]+:/, ""), a = a.replace(/\-/g, ""), d = null, d = "undefined" != typeof b.Element[a] ? new b.Element[a](c) : new b.Element.MISSING(c);
            d.type = c.nodeName;
            return d
        };
        b.load = function (c, a) {
            b.loadXml(c, b.ajax(a))
        };
        b.loadXml = function (c, a) {
            b.loadXmlDoc(c, b.parseXml(a))
        };
        b.loadXmlDoc = function (c, a) {
            b.init(c);
            var d = function (a) {
                for (var b = c.canvas; b;)a.x -= b.offsetLeft, a.y -= b.offsetTop, b = b.offsetParent;
                window.scrollX && (a.x += window.scrollX);
                window.scrollY && (a.y += window.scrollY);
                return a
            };
            !0 != b.opts.ignoreMouse && (c.canvas.onclick = function (a) {
                a = d(new b.Point(null != a ? a.clientX : event.clientX, null != a ? a.clientY : event.clientY));
                b.Mouse.onclick(a.x, a.y)
            },
                c.canvas.onmousemove = function (a) {
                    a = d(new b.Point(null != a ? a.clientX : event.clientX, null != a ? a.clientY : event.clientY));
                    b.Mouse.onmousemove(a.x, a.y)
                });
            var e = b.CreateElement(a.documentElement), h = e.root = !0, l = function () {
                b.ViewPort.Clear();
                c.canvas.parentNode && b.ViewPort.SetCurrent(c.canvas.parentNode.clientWidth, c.canvas.parentNode.clientHeight);
                !0 != b.opts.ignoreDimensions && (e.style("width").hasValue() && (c.canvas.width = e.style("width").toPixels("x"), c.canvas.style.width = c.canvas.width + "px"), e.style("height").hasValue() &&
                (c.canvas.height = e.style("height").toPixels("y"), c.canvas.style.height = c.canvas.height + "px"));
                var d = c.canvas.clientWidth || c.canvas.width, f = c.canvas.clientHeight || c.canvas.height;
                !0 == b.opts.ignoreDimensions && e.style("width").hasValue() && e.style("height").hasValue() && (d = e.style("width").toPixels("x"), f = e.style("height").toPixels("y"));
                b.ViewPort.SetCurrent(d, f);
                null != b.opts.offsetX && (e.attribute("x", !0).value = b.opts.offsetX);
                null != b.opts.offsetY && (e.attribute("y", !0).value = b.opts.offsetY);
                if (null !=
                    b.opts.scaleWidth && null != b.opts.scaleHeight) {
                    var l = 1, m = 1, q = b.ToNumberArray(e.attribute("viewBox").value);
                    e.attribute("width").hasValue() ? l = e.attribute("width").toPixels("x") / b.opts.scaleWidth : isNaN(q[2]) || (l = q[2] / b.opts.scaleWidth);
                    e.attribute("height").hasValue() ? m = e.attribute("height").toPixels("y") / b.opts.scaleHeight : isNaN(q[3]) || (m = q[3] / b.opts.scaleHeight);
                    e.attribute("width", !0).value = b.opts.scaleWidth;
                    e.attribute("height", !0).value = b.opts.scaleHeight;
                    e.attribute("viewBox", !0).value = "0 0 " + d *
                    l + " " + f * m;
                    e.attribute("preserveAspectRatio", !0).value = "none"
                }
                !0 != b.opts.ignoreClear && c.clearRect(0, 0, d, f);
                e.render(c);
                h && (h = !1, "function" == typeof b.opts.renderCallback && b.opts.renderCallback(a))
            }, f = !0;
            b.ImagesLoaded() && (f = !1, l());
            b.intervalID = setInterval(function () {
                var a = !1;
                f && b.ImagesLoaded() && (f = !1, a = !0);
                !0 != b.opts.ignoreMouse && (a |= b.Mouse.hasEvents());
                if (!0 != b.opts.ignoreAnimation)for (var d = 0; d < b.Animations.length; d++)a |= b.Animations[d].update(1E3 / b.FRAMERATE);
                "function" == typeof b.opts.forceRedraw &&
                !0 == b.opts.forceRedraw() && (a = !0);
                a && (l(), b.Mouse.runEvents())
            }, 1E3 / b.FRAMERATE)
        };
        b.stop = function () {
            b.intervalID && clearInterval(b.intervalID)
        };
        b.Mouse = new function () {
            this.events = [];
            this.hasEvents = function () {
                return 0 != this.events.length
            };
            this.onclick = function (b, a) {
                this.events.push({
                    type: "onclick", x: b, y: a, run: function (a) {
                        if (a.onclick)a.onclick()
                    }
                })
            };
            this.onmousemove = function (b, a) {
                this.events.push({
                    type: "onmousemove", x: b, y: a, run: function (a) {
                        if (a.onmousemove)a.onmousemove()
                    }
                })
            };
            this.eventElements = [];
            this.checkPath =
                function (b, a) {
                    for (var d = 0; d < this.events.length; d++) {
                        var e = this.events[d];
                        a.isPointInPath && a.isPointInPath(e.x, e.y) && (this.eventElements[d] = b)
                    }
                };
            this.checkBoundingBox = function (b, a) {
                for (var d = 0; d < this.events.length; d++) {
                    var e = this.events[d];
                    a.isPointInBox(e.x, e.y) && (this.eventElements[d] = b)
                }
            };
            this.runEvents = function () {
                b.ctx.canvas.style.cursor = "";
                for (var c = 0; c < this.events.length; c++)for (var a = this.events[c], d = this.eventElements[c]; d;)a.run(d), d = d.parent;
                this.events = [];
                this.eventElements = []
            }
        };
        return b
    }

    this.canvg = function (b, c, a) {
        if (null == b && null == c && null == a) {
            c = document.getElementsByTagName("svg");
            for (var d = 0; d < c.length; d++) {
                b = c[d];
                a = document.createElement("canvas");
                a.width = b.clientWidth;
                a.height = b.clientHeight;
                b.parentNode.insertBefore(a, b);
                b.parentNode.removeChild(b);
                var g = document.createElement("div");
                g.appendChild(b);
                canvg(a, g.innerHTML)
            }
        } else {
            a = a || {};
            "string" == typeof b && (b = document.getElementById(b));
            null != b.svg && b.svg.stop();
            d = e();
            if (1 != b.childNodes.length || "OBJECT" != b.childNodes[0].nodeName)b.svg =
                d;
            d.opts = a;
            b = b.getContext("2d");
            "undefined" != typeof c.documentElement ? d.loadXmlDoc(b, c) : "<" == c.substr(0, 1) ? d.loadXml(b, c) : d.load(b, c)
        }
    }
})();
"undefined" != typeof CanvasRenderingContext2D && (CanvasRenderingContext2D.prototype.drawSvg = function (e, b, c, a, d) {
    canvg(this.canvas, e, {
        ignoreMouse: !0,
        ignoreAnimation: !0,
        ignoreDimensions: !0,
        ignoreClear: !0,
        offsetX: b,
        offsetY: c,
        scaleWidth: a,
        scaleHeight: d
    })
});
if (AmCharts.isModern) {
    var saveAs = saveAs || "undefined" !== typeof navigator && navigator.msSaveOrOpenBlob && navigator.msSaveOrOpenBlob.bind(navigator) || function (e) {
            var b = e.document, c = e.URL || e.webkitURL || e, a = b.createElementNS("http://www.w3.org/1999/xhtml", "a"), d = !e.externalHost && "download"in a, g = e.webkitRequestFileSystem, h = e.requestFileSystem || g || e.mozRequestFileSystem, l = function (a) {
                (e.setImmediate || e.setTimeout)(function () {
                    throw a;
                }, 0)
            }, f = 0, k = [], p = function (a, b, d) {
                b = [].concat(b);
                for (var c = b.length; c--;) {
                    var e =
                        a["on" + b[c]];
                    if ("function" === typeof e)try {
                        e.call(a, d || a)
                    } catch (f) {
                        l(f)
                    }
                }
            }, n = function (c, l) {
                var m = this, n = c.type, x = !1, z, E, D = function () {
                    var a = (e.URL || e.webkitURL || e).createObjectURL(c);
                    k.push(a);
                    return a
                }, w = function () {
                    p(m, ["writestart", "progress", "write", "writeend"])
                }, B = function () {
                    if (x || !z)z = D(c);
                    E ? E.location.href = z : window.open(z, "_blank");
                    m.readyState = m.DONE;
                    w()
                }, s = function (a) {
                    return function () {
                        if (m.readyState !== m.DONE)return a.apply(this, arguments)
                    }
                }, C = {create: !0, exclusive: !1}, H;
                m.readyState = m.INIT;
                l || (l = "download");
                if (d)z = D(c), b = e.document, a = b.createElementNS("http://www.w3.org/1999/xhtml", "a"), a.href = z, a.download = l, n = b.createEvent("MouseEvents"), n.initMouseEvent("click", !0, !1, e, 0, 0, 0, 0, 0, !1, !1, !1, !1, 0, null), a.dispatchEvent(n), m.readyState = m.DONE, w(); else {
                    e.chrome && n && "application/octet-stream" !== n && (H = c.slice || c.webkitSlice, c = H.call(c, 0, c.size, "application/octet-stream"), x = !0);
                    g && "download" !== l && (l += ".download");
                    if ("application/octet-stream" === n || g)E = e;
                    h ? (f += c.size, h(e.TEMPORARY, f, s(function (a) {
                        a.root.getDirectory("saved",
                            C, s(function (a) {
                                var b = function () {
                                    a.getFile(l, C, s(function (a) {
                                        a.createWriter(s(function (b) {
                                            b.onwriteend = function (b) {
                                                E.location.href = a.toURL();
                                                k.push(a);
                                                m.readyState = m.DONE;
                                                p(m, "writeend", b)
                                            };
                                            b.onerror = function () {
                                                var a = b.error;
                                                a.code !== a.ABORT_ERR && B()
                                            };
                                            ["writestart", "progress", "write", "abort"].forEach(function (a) {
                                                b["on" + a] = m["on" + a]
                                            });
                                            b.write(c);
                                            m.abort = function () {
                                                b.abort();
                                                m.readyState = m.DONE
                                            };
                                            m.readyState = m.WRITING
                                        }), B)
                                    }), B)
                                };
                                a.getFile(l, {create: !1}, s(function (a) {
                                    a.remove();
                                    b()
                                }), s(function (a) {
                                    a.code ===
                                    a.NOT_FOUND_ERR ? b() : B()
                                }))
                            }), B)
                    }), B)) : B()
                }
            }, m = n.prototype;
            m.abort = function () {
                this.readyState = this.DONE;
                p(this, "abort")
            };
            m.readyState = m.INIT = 0;
            m.WRITING = 1;
            m.DONE = 2;
            m.error = m.onwritestart = m.onprogress = m.onwrite = m.onabort = m.onerror = m.onwriteend = null;
            e.addEventListener("unload", function () {
                for (var a = k.length; a--;) {
                    var b = k[a];
                    "string" === typeof b ? c.revokeObjectURL(b) : b.remove()
                }
                k.length = 0
            }, !1);
            return function (a, b) {
                return new n(a, b)
            }
        }(this.self || this.window || this.content);
    "undefined" !== typeof module && (module.exports =
        saveAs)
}
function RGBColor(e) {
    this.ok = !1;
    "#" == e.charAt(0) && (e = e.substr(1, 6));
    e = e.replace(/ /g, "");
    e = e.toLowerCase();
    var b = {
        aliceblue: "f0f8ff",
        antiquewhite: "faebd7",
        aqua: "00ffff",
        aquamarine: "7fffd4",
        azure: "f0ffff",
        beige: "f5f5dc",
        bisque: "ffe4c4",
        black: "000000",
        blanchedalmond: "ffebcd",
        blue: "0000ff",
        blueviolet: "8a2be2",
        brown: "a52a2a",
        burlywood: "deb887",
        cadetblue: "5f9ea0",
        chartreuse: "7fff00",
        chocolate: "d2691e",
        coral: "ff7f50",
        cornflowerblue: "6495ed",
        cornsilk: "fff8dc",
        crimson: "dc143c",
        cyan: "00ffff",
        darkblue: "00008b",
        darkcyan: "008b8b",
        darkgoldenrod: "b8860b",
        darkgray: "a9a9a9",
        darkgreen: "006400",
        darkkhaki: "bdb76b",
        darkmagenta: "8b008b",
        darkolivegreen: "556b2f",
        darkorange: "ff8c00",
        darkorchid: "9932cc",
        darkred: "8b0000",
        darksalmon: "e9967a",
        darkseagreen: "8fbc8f",
        darkslateblue: "483d8b",
        darkslategray: "2f4f4f",
        darkturquoise: "00ced1",
        darkviolet: "9400d3",
        deeppink: "ff1493",
        deepskyblue: "00bfff",
        dimgray: "696969",
        dodgerblue: "1e90ff",
        feldspar: "d19275",
        firebrick: "b22222",
        floralwhite: "fffaf0",
        forestgreen: "228b22",
        fuchsia: "ff00ff",
        gainsboro: "dcdcdc",
        ghostwhite: "f8f8ff",
        gold: "ffd700",
        goldenrod: "daa520",
        gray: "808080",
        green: "008000",
        greenyellow: "adff2f",
        honeydew: "f0fff0",
        hotpink: "ff69b4",
        indianred: "cd5c5c",
        indigo: "4b0082",
        ivory: "fffff0",
        khaki: "f0e68c",
        lavender: "e6e6fa",
        lavenderblush: "fff0f5",
        lawngreen: "7cfc00",
        lemonchiffon: "fffacd",
        lightblue: "add8e6",
        lightcoral: "f08080",
        lightcyan: "e0ffff",
        lightgoldenrodyellow: "fafad2",
        lightgrey: "d3d3d3",
        lightgreen: "90ee90",
        lightpink: "ffb6c1",
        lightsalmon: "ffa07a",
        lightseagreen: "20b2aa",
        lightskyblue: "87cefa",
        lightslateblue: "8470ff",
        lightslategray: "778899",
        lightsteelblue: "b0c4de",
        lightyellow: "ffffe0",
        lime: "00ff00",
        limegreen: "32cd32",
        linen: "faf0e6",
        magenta: "ff00ff",
        maroon: "800000",
        mediumaquamarine: "66cdaa",
        mediumblue: "0000cd",
        mediumorchid: "ba55d3",
        mediumpurple: "9370d8",
        mediumseagreen: "3cb371",
        mediumslateblue: "7b68ee",
        mediumspringgreen: "00fa9a",
        mediumturquoise: "48d1cc",
        mediumvioletred: "c71585",
        midnightblue: "191970",
        mintcream: "f5fffa",
        mistyrose: "ffe4e1",
        moccasin: "ffe4b5",
        navajowhite: "ffdead",
        navy: "000080",
        oldlace: "fdf5e6",
        olive: "808000",
        olivedrab: "6b8e23",
        orange: "ffa500",
        orangered: "ff4500",
        orchid: "da70d6",
        palegoldenrod: "eee8aa",
        palegreen: "98fb98",
        paleturquoise: "afeeee",
        palevioletred: "d87093",
        papayawhip: "ffefd5",
        peachpuff: "ffdab9",
        peru: "cd853f",
        pink: "ffc0cb",
        plum: "dda0dd",
        powderblue: "b0e0e6",
        purple: "800080",
        red: "ff0000",
        rosybrown: "bc8f8f",
        royalblue: "4169e1",
        saddlebrown: "8b4513",
        salmon: "fa8072",
        sandybrown: "f4a460",
        seagreen: "2e8b57",
        seashell: "fff5ee",
        sienna: "a0522d",
        silver: "c0c0c0",
        skyblue: "87ceeb",
        slateblue: "6a5acd",
        slategray: "708090",
        snow: "fffafa",
        springgreen: "00ff7f",
        steelblue: "4682b4",
        tan: "d2b48c",
        teal: "008080",
        thistle: "d8bfd8",
        tomato: "ff6347",
        turquoise: "40e0d0",
        violet: "ee82ee",
        violetred: "d02090",
        wheat: "f5deb3",
        white: "ffffff",
        whitesmoke: "f5f5f5",
        yellow: "ffff00",
        yellowgreen: "9acd32"
    }, c;
    for (c in b)e == c && (e = b[c]);
    var a = [{
        re: /^rgb\((\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3})\)$/,
        example: ["rgb(123, 234, 45)", "rgb(255,234,245)"],
        process: function (a) {
            return [parseInt(a[1]), parseInt(a[2]), parseInt(a[3])]
        }
    }, {
        re: /^(\w{2})(\w{2})(\w{2})$/, example: ["#00ff00",
            "336699"], process: function (a) {
            return [parseInt(a[1], 16), parseInt(a[2], 16), parseInt(a[3], 16)]
        }
    }, {
        re: /^(\w{1})(\w{1})(\w{1})$/, example: ["#fb0", "f0f"], process: function (a) {
            return [parseInt(a[1] + a[1], 16), parseInt(a[2] + a[2], 16), parseInt(a[3] + a[3], 16)]
        }
    }];
    for (c = 0; c < a.length; c++) {
        var d = a[c].process, g = a[c].re.exec(e);
        g && (channels = d(g), this.r = channels[0], this.g = channels[1], this.b = channels[2], this.ok = !0)
    }
    this.r = 0 > this.r || isNaN(this.r) ? 0 : 255 < this.r ? 255 : this.r;
    this.g = 0 > this.g || isNaN(this.g) ? 0 : 255 < this.g ? 255 : this.g;
    this.b = 0 > this.b || isNaN(this.b) ? 0 : 255 < this.b ? 255 : this.b;
    this.toRGB = function () {
        return "rgb(" + this.r + ", " + this.g + ", " + this.b + ")"
    };
    this.toHex = function () {
        var a = this.r.toString(16), b = this.g.toString(16), d = this.b.toString(16);
        1 == a.length && (a = "0" + a);
        1 == b.length && (b = "0" + b);
        1 == d.length && (d = "0" + d);
        return "#" + a + b + d
    };
    this.getHelpXML = function () {
        for (var d = [], c = 0; c < a.length; c++)for (var e = a[c].example, g = 0; g < e.length; g++)d[d.length] = e[g];
        for (var p in b)d[d.length] = p;
        e = document.createElement("ul");
        e.setAttribute("id",
            "rgbcolor-examples");
        for (c = 0; c < d.length; c++)try {
            var n = document.createElement("li"), m = new RGBColor(d[c]), q = document.createElement("div");
            q.style.cssText = "margin: 3px; border: 1px solid black; background:" + m.toHex() + "; color:" + m.toHex();
            q.appendChild(document.createTextNode("test"));
            var u = document.createTextNode(" " + d[c] + " -> " + m.toRGB() + " -> " + m.toHex());
            n.appendChild(q);
            n.appendChild(u);
            e.appendChild(n)
        } catch (v) {
        }
        return e
    }
}
var jsPDF = function () {
    function e(a, d, g, h) {
        a = "undefined" === typeof a ? "p" : a.toString().toLowerCase();
        "undefined" === typeof d && (d = "mm");
        "undefined" === typeof g && (g = "a4");
        "undefined" === typeof h && "undefined" === typeof zpipe && (h = !1);
        var l = g.toString().toLowerCase(), f = [], k = 0, p = h;
        h = {
            a0: [2383.94, 3370.39],
            a1: [1683.78, 2383.94],
            a2: [1190.55, 1683.78],
            a3: [841.89, 1190.55],
            a4: [595.28, 841.89],
            a5: [419.53, 595.28],
            a6: [297.64, 419.53],
            a7: [209.76, 297.64],
            a8: [147.4, 209.76],
            a9: [104.88, 147.4],
            a10: [73.7, 104.88],
            b0: [2834.65, 4008.19],
            b1: [2004.09, 2834.65],
            b2: [1417.32, 2004.09],
            b3: [1000.63, 1417.32],
            b4: [708.66, 1000.63],
            b5: [498.9, 708.66],
            b6: [354.33, 498.9],
            b7: [249.45, 354.33],
            b8: [175.75, 249.45],
            b9: [124.72, 175.75],
            b10: [87.87, 124.72],
            c0: [2599.37, 3676.54],
            c1: [1836.85, 2599.37],
            c2: [1298.27, 1836.85],
            c3: [918.43, 1298.27],
            c4: [649.13, 918.43],
            c5: [459.21, 649.13],
            c6: [323.15, 459.21],
            c7: [229.61, 323.15],
            c8: [161.57, 229.61],
            c9: [113.39, 161.57],
            c10: [79.37, 113.39],
            letter: [612, 792],
            "government-letter": [576, 756],
            legal: [612, 1008],
            "junior-legal": [576, 360],
            ledger: [1224,
                792],
            tabloid: [792, 1224]
        };
        var n = "0 g", m = 0, q = [], u = 2, v = !1, A = [], x = {}, z = {}, E = 16, D, w, B, s, C = {
            title: "",
            subject: "",
            author: "",
            keywords: "",
            creator: ""
        }, H = 0, O = 0, y = {}, F = new c(y), J, t = function (a) {
            return a.toFixed(2)
        }, K = function (a) {
            var b = a.toFixed(0);
            return 10 > a ? "0" + b : b
        }, r = function (a) {
            v ? q[m].push(a) : (f.push(a), k += a.length + 1)
        }, I = function () {
            u++;
            A[u] = k;
            r(u + " 0 obj");
            return u
        }, Q = function (a) {
            r("stream");
            r(a);
            r("endstream")
        }, R, S, M, G = function (a, b) {
            var d;
            d = a;
            var c = b, e, f, g, h, k, l;
            void 0 === c && (c = {});
            e = c.sourceEncoding ? e : "Unicode";
            g = c.outputEncoding;
            if ((c.autoencode || g) && x[D].metadata && x[D].metadata[e] && x[D].metadata[e].encoding && (e = x[D].metadata[e].encoding, !g && x[D].encoding && (g = x[D].encoding), !g && e.codePages && (g = e.codePages[0]), "string" === typeof g && (g = e[g]), g)) {
                k = !1;
                h = [];
                e = 0;
                for (f = d.length; e < f; e++)(l = g[d.charCodeAt(e)]) ? h.push(String.fromCharCode(l)) : h.push(d[e]), h[e].charCodeAt(0) >> 8 && (k = !0);
                d = h.join("")
            }
            for (e = d.length; void 0 === k && 0 !== e;)d.charCodeAt(e - 1) >> 8 && (k = !0), e--;
            if (k) {
                h = c.noBOM ? [] : [254, 255];
                e = 0;
                for (f = d.length; e <
                f; e++) {
                    l = d.charCodeAt(e);
                    c = l >> 8;
                    if (c >> 8)throw Error("Character at position " + e.toString(10) + " of string '" + d + "' exceeds 16bits. Cannot be encoded into UCS-2 BE");
                    h.push(c);
                    h.push(l - (c << 8))
                }
                d = String.fromCharCode.apply(void 0, h)
            }
            return d.replace(/\\/g, "\\\\").replace(/\(/g, "\\(").replace(/\)/g, "\\)")
        }, T = function () {
            m++;
            v = !0;
            q[m] = [];
            r(t(.200025 * s) + " w");
            r("0 G");
            0 !== H && r(H.toString(10) + " J");
            0 !== O && r(O.toString(10) + " j");
            F.publish("addPage", {pageNumber: m})
        }, P = function (a, b) {
            var d;
            void 0 === a && (a = x[D].fontName);
            void 0 === b && (b = x[D].fontStyle);
            try {
                d = z[a][b]
            } catch (c) {
                d = void 0
            }
            if (!d)throw Error("Unable to look up font label for font '" + a + "', '" + b + "'. Refer to getFontList() for available fonts.");
            return d
        }, L = function () {
            v = !1;
            f = [];
            A = [];
            r("%PDF-1.3");
            R = B * s;
            S = w * s;
            var a, b, d, c, e;
            for (a = 1; a <= m; a++) {
                I();
                r("<</Type /Page");
                r("/Parent 1 0 R");
                r("/Resources 2 0 R");
                r("/Contents " + (u + 1) + " 0 R>>");
                r("endobj");
                b = q[a].join("\n");
                I();
                if (p) {
                    d = [];
                    for (c = 0; c < b.length; ++c)d[c] = b.charCodeAt(c);
                    e = adler32cs.from(b);
                    b = new Deflater(6);
                    b.append(new Uint8Array(d));
                    b = b.flush();
                    d = [new Uint8Array([120, 156]), new Uint8Array(b), new Uint8Array([e & 255, e >> 8 & 255, e >> 16 & 255, e >> 24 & 255])];
                    b = "";
                    for (c in d)d.hasOwnProperty(c) && (b += String.fromCharCode.apply(null, d[c]));
                    r("<</Length " + b.length + " /Filter [/FlateDecode]>>")
                } else r("<</Length " + b.length + ">>");
                Q(b);
                r("endobj")
            }
            A[1] = k;
            r("1 0 obj");
            r("<</Type /Pages");
            M = "/Kids [";
            for (c = 0; c < m; c++)M += 3 + 2 * c + " 0 R ";
            r(M + "]");
            r("/Count " + m);
            r("/MediaBox [0 0 " + t(R) + " " + t(S) + "]");
            r(">>");
            r("endobj");
            for (var g in x)x.hasOwnProperty(g) &&
            (a = x[g], a.objectNumber = I(), r("<</BaseFont/" + a.PostScriptName + "/Type/Font"), "string" === typeof a.encoding && r("/Encoding/" + a.encoding), r("/Subtype/Type1>>"), r("endobj"));
            F.publish("putResources");
            A[2] = k;
            r("2 0 obj");
            r("<<");
            r("/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]");
            r("/Font <<");
            for (var h in x)x.hasOwnProperty(h) && r("/" + h + " " + x[h].objectNumber + " 0 R");
            r(">>");
            r("/XObject <<");
            F.publish("putXobjectDict");
            r(">>");
            r(">>");
            r("endobj");
            F.publish("postPutResources");
            I();
            r("<<");
            r("/Producer (jsPDF 0.9.0rc2)");
            C.title && r("/Title (" + G(C.title) + ")");
            C.subject && r("/Subject (" + G(C.subject) + ")");
            C.author && r("/Author (" + G(C.author) + ")");
            C.keywords && r("/Keywords (" + G(C.keywords) + ")");
            C.creator && r("/Creator (" + G(C.creator) + ")");
            g = new Date;
            r("/CreationDate (D:" + [g.getFullYear(), K(g.getMonth() + 1), K(g.getDate()), K(g.getHours()), K(g.getMinutes()), K(g.getSeconds())].join("") + ")");
            r(">>");
            r("endobj");
            I();
            r("<<");
            r("/Type /Catalog");
            r("/Pages 1 0 R");
            r("/OpenAction [3 0 R /FitH null]");
            r("/PageLayout /OneColumn");
            F.publish("putCatalog");
            r(">>");
            r("endobj");
            g = k;
            r("xref");
            r("0 " + (u + 1));
            r("0000000000 65535 f ");
            for (h = 1; h <= u; h++)a = A[h].toFixed(0), a = 10 > a.length ? Array(11 - a.length).join("0") + a : a, r(a + " 00000 n ");
            r("trailer");
            r("<<");
            r("/Size " + (u + 1));
            r("/Root " + u + " 0 R");
            r("/Info " + (u - 1) + " 0 R");
            r(">>");
            r("startxref");
            r(g);
            r("%%EOF");
            v = !0;
            return f.join("\n")
        }, N = function (a) {
            var b = "S";
            if ("F" === a)b = "f"; else if ("FD" === a || "DF" === a)b = "B";
            return b
        }, U = function (a, b) {
            var d, c, e, g;
            switch (a) {
                case void 0:
                    return L();
                case "save":
                    if (navigator.getUserMedia &&
                        (void 0 === window.URL || void 0 === window.URL.createObjectURL))return y.output("dataurlnewwindow");
                    d = L();
                    c = d.length;
                    e = new Uint8Array(new ArrayBuffer(c));
                    for (g = 0; g < c; g++)e[g] = d.charCodeAt(g);
                    d = new Blob([e], {type: "application/pdf"});
                    saveAs(d, b);
                    break;
                case "datauristring":
                case "dataurlstring":
                    return "data:application/pdf;base64," + btoa(L());
                case "datauri":
                case "dataurl":
                    document.location.href = "data:application/pdf;base64," + btoa(L());
                    break;
                case "dataurlnewwindow":
                    window.open("data:application/pdf;base64," +
                    btoa(L()));
                    break;
                default:
                    throw Error('Output type "' + a + '" is not supported.');
            }
        };
        if ("pt" === d)s = 1; else if ("mm" === d)s = 72 / 25.4; else if ("cm" === d)s = 72 / 2.54; else if ("in" === d)s = 72; else throw"Invalid unit: " + d;
        if (h.hasOwnProperty(l))w = h[l][1] / s, B = h[l][0] / s; else try {
            w = g[1], B = g[0]
        } catch (V) {
            throw"Invalid format: " + g;
        }
        if ("p" === a || "portrait" === a)a = "p", B > w && (a = B, B = w, w = a); else if ("l" === a || "landscape" === a)a = "l", w > B && (a = B, B = w, w = a); else throw"Invalid orientation: " + a;
        y.internal = {
            pdfEscape: G,
            getStyle: N,
            getFont: function () {
                return x[P.apply(y,
                    arguments)]
            },
            getFontSize: function () {
                return E
            },
            getLineHeight: function () {
                return 1.15 * E
            },
            btoa: btoa,
            write: function (a, b, d, c) {
                r(1 === arguments.length ? a : Array.prototype.join.call(arguments, " "))
            },
            getCoordinateString: function (a) {
                return t(a * s)
            },
            getVerticalCoordinateString: function (a) {
                return t((w - a) * s)
            },
            collections: {},
            newObject: I,
            putStream: Q,
            events: F,
            scaleFactor: s,
            pageSize: {width: B, height: w},
            output: function (a, b) {
                return U(a, b)
            },
            getNumberOfPages: function () {
                return q.length - 1
            },
            pages: q
        };
        y.addPage = function () {
            T();
            return this
        };
        y.text = function (a, b, d, c) {
            var e, g;
            "number" === typeof a && (e = a, g = b, a = d, b = e, d = g);
            "string" === typeof a && a.match(/[\n\r]/) && (a = a.split(/\r\n|\r|\n/g));
            "undefined" === typeof c ? c = {
                noBOM: !0,
                autoencode: !0
            } : (void 0 === c.noBOM && (c.noBOM = !0), void 0 === c.autoencode && (c.autoencode = !0));
            if ("string" === typeof a)c = G(a, c); else if (a instanceof Array) {
                a = a.concat();
                for (e = a.length - 1; -1 !== e; e--)a[e] = G(a[e], c);
                c = a.join(") Tj\nT* (")
            } else throw Error('Type of text must be string or Array. "' + a + '" is not recognized.');
            r("BT\n/" + D + " " + E + " Tf\n" + 1.15 * E + " TL\n" + n + "\n" + t(b * s) + " " + t((w - d) * s) + " Td\n(" + c + ") Tj\nET");
            return this
        };
        y.line = function (a, b, d, c) {
            r(t(a * s) + " " + t((w - b) * s) + " m " + t(d * s) + " " + t((w - c) * s) + " l S");
            return this
        };
        y.lines = function (a, b, d, c, e, g) {
            var f, h, k, l, m, n, q, p;
            "number" === typeof a && (f = a, h = b, a = d, b = f, d = h);
            e = N(e);
            c = void 0 === c ? [1, 1] : c;
            r((b * s).toFixed(3) + " " + ((w - d) * s).toFixed(3) + " m ");
            f = c[0];
            c = c[1];
            h = a.length;
            p = d;
            for (d = 0; d < h; d++)k = a[d], 2 === k.length ? (b = k[0] * f + b, p = k[1] * c + p, r((b * s).toFixed(3) + " " + ((w - p) * s).toFixed(3) +
            " l")) : (l = k[0] * f + b, m = k[1] * c + p, n = k[2] * f + b, q = k[3] * c + p, b = k[4] * f + b, p = k[5] * c + p, r((l * s).toFixed(3) + " " + ((w - m) * s).toFixed(3) + " " + (n * s).toFixed(3) + " " + ((w - q) * s).toFixed(3) + " " + (b * s).toFixed(3) + " " + ((w - p) * s).toFixed(3) + " c"));
            !0 == g && r(" h");
            r(e);
            return this
        };
        y.rect = function (a, b, d, c, e) {
            e = N(e);
            r([t(a * s), t((w - b) * s), t(d * s), t(-c * s), "re", e].join(" "));
            return this
        };
        y.triangle = function (a, b, d, c, e, g, f) {
            this.lines([[d - a, c - b], [e - d, g - c], [a - e, b - g]], a, b, [1, 1], f, !0);
            return this
        };
        y.roundedRect = function (a, b, d, c, e, g, f) {
            var h =
                4 / 3 * (Math.SQRT2 - 1);
            this.lines([[d - 2 * e, 0], [e * h, 0, e, g - g * h, e, g], [0, c - 2 * g], [0, g * h, -(e * h), g, -e, g], [-d + 2 * e, 0], [-(e * h), 0, -e, -(g * h), -e, -g], [0, -c + 2 * g], [0, -(g * h), e * h, -g, e, -g]], a + e, b, [1, 1], f);
            return this
        };
        y.ellipse = function (a, b, d, c, e) {
            e = N(e);
            var g = 4 / 3 * (Math.SQRT2 - 1) * d, f = 4 / 3 * (Math.SQRT2 - 1) * c;
            r([t((a + d) * s), t((w - b) * s), "m", t((a + d) * s), t((w - (b - f)) * s), t((a + g) * s), t((w - (b - c)) * s), t(a * s), t((w - (b - c)) * s), "c"].join(" "));
            r([t((a - g) * s), t((w - (b - c)) * s), t((a - d) * s), t((w - (b - f)) * s), t((a - d) * s), t((w - b) * s), "c"].join(" "));
            r([t((a -
            d) * s), t((w - (b + f)) * s), t((a - g) * s), t((w - (b + c)) * s), t(a * s), t((w - (b + c)) * s), "c"].join(" "));
            r([t((a + g) * s), t((w - (b + c)) * s), t((a + d) * s), t((w - (b + f)) * s), t((a + d) * s), t((w - b) * s), "c", e].join(" "));
            return this
        };
        y.circle = function (a, b, d, c) {
            return this.ellipse(a, b, d, d, c)
        };
        y.setProperties = function (a) {
            for (var b in C)C.hasOwnProperty(b) && a[b] && (C[b] = a[b]);
            return this
        };
        y.setFontSize = function (a) {
            E = a;
            return this
        };
        y.setFont = function (a, b) {
            D = P(a, b);
            return this
        };
        y.setFontStyle = y.setFontType = function (a) {
            D = P(void 0, a);
            return this
        };
        y.getFontList = function () {
            var a = {}, b, d, c;
            for (b in z)if (z.hasOwnProperty(b))for (d in a[b] = c = [], z[b])z[b].hasOwnProperty(d) && c.push(d);
            return a
        };
        y.setLineWidth = function (a) {
            r((a * s).toFixed(2) + " w");
            return this
        };
        y.setDrawColor = function (a, b, d, c) {
            a = void 0 === b || void 0 === c && a === b === d ? "string" === typeof a ? a + " G" : t(a / 255) + " G" : void 0 === c ? "string" === typeof a ? [a, b, d, "RG"].join(" ") : [t(a / 255), t(b / 255), t(d / 255), "RG"].join(" ") : "string" === typeof a ? [a, b, d, c, "K"].join(" ") : [t(a), t(b), t(d), t(c), "K"].join(" ");
            r(a);
            return this
        };
        y.setFillColor = function (a, b, d, c) {
            a = void 0 === b || void 0 === c && a === b === d ? "string" === typeof a ? a + " g" : t(a / 255) + " g" : void 0 === c ? "string" === typeof a ? [a, b, d, "rg"].join(" ") : [t(a / 255), t(b / 255), t(d / 255), "rg"].join(" ") : "string" === typeof a ? [a, b, d, c, "k"].join(" ") : [t(a), t(b), t(d), t(c), "k"].join(" ");
            r(a);
            return this
        };
        y.setTextColor = function (a, b, d) {
            var c = /#[0-9A-Fa-f]{6}/;
            "string" == typeof a && c.test(a) && (a = a.replace("#", ""), d = parseInt(a, 16), a = d >> 16 & 255, b = d >> 8 & 255, d &= 255);
            n = 0 === a && 0 === b && 0 === d || "undefined" === typeof b ?
            (a / 255).toFixed(3) + " g" : [(a / 255).toFixed(3), (b / 255).toFixed(3), (d / 255).toFixed(3), "rg"].join(" ");
            return this
        };
        y.CapJoinStyles = {
            0: 0,
            butt: 0,
            but: 0,
            miter: 0,
            1: 1,
            round: 1,
            rounded: 1,
            circle: 1,
            2: 2,
            projecting: 2,
            project: 2,
            square: 2,
            bevel: 2
        };
        y.setLineCap = function (a) {
            var b = this.CapJoinStyles[a];
            if (void 0 === b)throw Error("Line cap style of '" + a + "' is not recognized. See or extend .CapJoinStyles property for valid styles");
            H = b;
            r(b.toString(10) + " J");
            return this
        };
        y.setLineJoin = function (a) {
            var b = this.CapJoinStyles[a];
            if (void 0 === b)throw Error("Line join style of '" + a + "' is not recognized. See or extend .CapJoinStyles property for valid styles");
            O = b;
            r(b.toString(10) + " j");
            return this
        };
        y.output = U;
        y.save = function (a) {
            y.output("save", a)
        };
        for (J in e.API)e.API.hasOwnProperty(J) && ("events" === J && e.API.events.length ? function (a, b) {
            var d, c, e;
            for (e = b.length - 1; -1 !== e; e--)d = b[e][0], c = b[e][1], a.subscribe.apply(a, [d].concat("function" === typeof c ? [c] : c))
        }(F, e.API.events) : y[J] = e.API[J]);
        (function () {
            var a = [["Helvetica", "helvetica",
                "normal"], ["Helvetica-Bold", "helvetica", "bold"], ["Helvetica-Oblique", "helvetica", "italic"], ["Helvetica-BoldOblique", "helvetica", "bolditalic"], ["Courier", "courier", "normal"], ["Courier-Bold", "courier", "bold"], ["Courier-Oblique", "courier", "italic"], ["Courier-BoldOblique", "courier", "bolditalic"], ["Times-Roman", "times", "normal"], ["Times-Bold", "times", "bold"], ["Times-Italic", "times", "italic"], ["Times-BoldItalic", "times", "bolditalic"]], d, c, e, g;
            d = 0;
            for (c = a.length; d < c; d++) {
                var f = a[d][0], h = a[d][1];
                e = a[d][2];
                g = "F" + (b(x) + 1).toString(10);
                var f = x[g] = {
                    id: g,
                    PostScriptName: f,
                    fontName: h,
                    fontStyle: e,
                    encoding: "StandardEncoding",
                    metadata: {}
                }, k = g;
                void 0 === z[h] && (z[h] = {});
                z[h][e] = k;
                F.publish("addFont", f);
                e = g;
                g = a[d][0].split("-");
                f = g[0];
                g = g[1] || "";
                void 0 === z[f] && (z[f] = {});
                z[f][g] = e
            }
            F.publish("addFonts", {fonts: x, dictionary: z})
        })();
        D = "F1";
        T();
        F.publish("initialized");
        return y
    }

    "undefined" === typeof btoa && (window.btoa = function (a) {
        var b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".split(""), c, e, l,
            f, k = 0, p = 0, n = "", n = [];
        do c = a.charCodeAt(k++), e = a.charCodeAt(k++), l = a.charCodeAt(k++), f = c << 16 | e << 8 | l, c = f >> 18 & 63, e = f >> 12 & 63, l = f >> 6 & 63, f &= 63, n[p++] = b[c] + b[e] + b[l] + b[f]; while (k < a.length);
        n = n.join("");
        a = a.length % 3;
        return (a ? n.slice(0, a - 3) : n) + "===".slice(a || 3)
    });
    "undefined" === typeof atob && (window.atob = function (a) {
        var b, c, e, l, f, k = 0, p = 0;
        l = "";
        var n = [];
        if (!a)return a;
        a += "";
        do b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".indexOf(a.charAt(k++)), c = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".indexOf(a.charAt(k++)),
            l = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".indexOf(a.charAt(k++)), f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".indexOf(a.charAt(k++)), e = b << 18 | c << 12 | l << 6 | f, b = e >> 16 & 255, c = e >> 8 & 255, e &= 255, 64 === l ? n[p++] = String.fromCharCode(b) : 64 === f ? n[p++] = String.fromCharCode(b, c) : n[p++] = String.fromCharCode(b, c, e); while (k < a.length);
        return l = n.join("")
    });
    var b = "function" === typeof Object.keys ? function (a) {
        return Object.keys(a).length
    } : function (a) {
        var b = 0, c;
        for (c in a)a.hasOwnProperty(c) &&
        b++;
        return b
    }, c = function (a) {
        this.topics = {};
        this.context = a;
        this.publish = function (a, b) {
            if (this.topics[a]) {
                var c = this.topics[a], e = [], f, k, p, n, m = function () {
                };
                b = Array.prototype.slice.call(arguments, 1);
                k = 0;
                for (p = c.length; k < p; k++)n = c[k], f = n[0], n[1] && (n[0] = m, e.push(k)), f.apply(this.context, b);
                k = 0;
                for (p = e.length; k < p; k++)c.splice(e[k], 1)
            }
        };
        this.subscribe = function (a, b, c) {
            this.topics[a] ? this.topics[a].push([b, c]) : this.topics[a] = [[b, c]];
            return {topic: a, callback: b}
        };
        this.unsubscribe = function (a) {
            if (this.topics[a.topic]) {
                var b =
                    this.topics[a.topic], c, e;
                c = 0;
                for (e = b.length; c < e; c++)b[c][0] === a.callback && b.splice(c, 1)
            }
        }
    };
    e.API = {events: []};
    return e
}();
(function (e) {
    var b = function () {
        var a = this.internal.collections.addImage_images, b;
        for (b in a) {
            var c = a[b], e = this.internal.newObject(), l = this.internal.write, f = this.internal.putStream;
            c.n = e;
            l("<</Type /XObject");
            l("/Subtype /Image");
            l("/Width " + c.w);
            l("/Height " + c.h);
            "Indexed" === c.cs ? l("/ColorSpace [/Indexed /DeviceRGB " + (c.pal.length / 3 - 1) + " " + (e + 1) + " 0 R]") : (l("/ColorSpace /" + c.cs), "DeviceCMYK" === c.cs && l("/Decode [1 0 1 0 1 0 1 0]"));
            l("/BitsPerComponent " + c.bpc);
            "f"in c && l("/Filter /" + c.f);
            "dp"in c &&
            l("/DecodeParms <<" + c.dp + ">>");
            if ("trns"in c && c.trns.constructor == Array)for (var k = "", p = 0; p < c.trns.length; p++)k += c[k][p] + " " + c.trns[p] + " ", l("/Mask [" + k + "]");
            "smask"in c && l("/SMask " + (e + 1) + " 0 R");
            l("/Length " + c.data.length + ">>");
            f(c.data);
            l("endobj")
        }
    }, c = function () {
        var a = this.internal.collections.addImage_images, b = this.internal.write, c, e;
        for (e in a)c = a[e], b("/I" + c.i, c.n, "0", "R")
    };
    e.addImage = function (a, d, e, h, l, f) {
        if ("object" === typeof a && 1 === a.nodeType) {
            d = document.createElement("canvas");
            d.width = a.clientWidth;
            d.height = a.clientHeight;
            var k = d.getContext("2d");
            if (!k)throw"addImage requires canvas to be supported by browser.";
            k.drawImage(a, 0, 0, d.width, d.height);
            a = d.toDataURL("image/jpeg");
            d = "JPEG"
        }
        if ("JPEG" !== d.toUpperCase())throw Error("addImage currently only supports format 'JPEG', not '" + d + "'");
        var p;
        d = this.internal.collections.addImage_images;
        var k = this.internal.getCoordinateString, n = this.internal.getVerticalCoordinateString;
        "data:image/jpeg;base64," === a.substring(0, 23) && (a = atob(a.replace("data:image/jpeg;base64,",
            "")));
        if (d)if (Object.keys)p = Object.keys(d).length; else {
            var m = d, q = 0;
            for (p in m)m.hasOwnProperty(p) && q++;
            p = q
        } else p = 0, this.internal.collections.addImage_images = d = {}, this.internal.events.subscribe("putResources", b), this.internal.events.subscribe("putXobjectDict", c);
        a:{
            var m = a, u;
            if (255 === !m.charCodeAt(0) || 216 === !m.charCodeAt(1) || 255 === !m.charCodeAt(2) || 224 === !m.charCodeAt(3) || 74 === !m.charCodeAt(6) || 70 === !m.charCodeAt(7) || 73 === !m.charCodeAt(8) || 70 === !m.charCodeAt(9) || 0 === !m.charCodeAt(10))throw Error("getJpegSize requires a binary jpeg file");
            u = 256 * m.charCodeAt(4) + m.charCodeAt(5);
            for (var q = 4, v = m.length; q < v;) {
                q += u;
                if (255 !== m.charCodeAt(q))throw Error("getJpegSize could not find the size of the image");
                if (192 === m.charCodeAt(q + 1) || 193 === m.charCodeAt(q + 1) || 194 === m.charCodeAt(q + 1) || 195 === m.charCodeAt(q + 1) || 196 === m.charCodeAt(q + 1) || 197 === m.charCodeAt(q + 1) || 198 === m.charCodeAt(q + 1) || 199 === m.charCodeAt(q + 1)) {
                    u = 256 * m.charCodeAt(q + 5) + m.charCodeAt(q + 6);
                    m = 256 * m.charCodeAt(q + 7) + m.charCodeAt(q + 8);
                    m = [m, u];
                    break a
                }
                q += 2;
                u = 256 * m.charCodeAt(q) + m.charCodeAt(q +
                1)
            }
            m = void 0
        }
        a = {w: m[0], h: m[1], cs: "DeviceRGB", bpc: 8, f: "DCTDecode", i: p, data: a};
        d[p] = a;
        l || f || (f = l = -96);
        0 > l && (l = -72 * a.w / l / this.internal.scaleFactor);
        0 > f && (f = -72 * a.h / f / this.internal.scaleFactor);
        0 === l && (l = f * a.w / a.h);
        0 === f && (f = l * a.h / a.w);
        this.internal.write("q", k(l), "0 0", k(f), k(e), n(h + f), "cm /I" + a.i, "Do Q");
        return this
    }
})(jsPDF.API);