module GoogleAnalyticsHelper
  def ga_generate_js(ua)
    return nil if ua.nil?
    return <<EOF
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '#{ua}']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script');
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 
      'http://www') + '.google-analytics.com/ga.js';
  ga.setAttribute('async', 'true');
  document.documentElement.firstChild.appendChild(ga);
})();
EOF
  end
  def ga_generate_non_async_js(ua)
    return nil if ua.nil?
    return <<EOF
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
try {
var pageTracker = _gat._getTracker("#{ua}");
pageTracker._trackPageview();
} catch(err) {}
EOF
  end
end
