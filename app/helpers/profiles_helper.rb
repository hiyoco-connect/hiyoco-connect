module ProfilesHelper
    class ProfileFormHelper < ActionView::Helpers::FormBuilder
        # Profile作成formでf.enum_helpという形で呼び出して使うことができる。
        def enum_select(record, options = {}, html_options = {})
          pluralized = record.to_s.pluralize
          klass = object.class
          base = klass.send(pluralized)
          i18n = klass.send("#{pluralized}_i18n")
          # 9行目のような長い記述を<%=portfolio_form.enum_select :status %>で済ませることができる。
          # form.select :status, Portfolio.statuses.map { |k| [t("portfolio.status_i18n.#{k}"), k]}
          select record.to_sym, base.keys.map { |key| [i18n[key], key] }, options, html_options
        end
      end
      
end
