{{- define "importer.definition.resourcegroup" }}
  {{- if eq .Values.global.subscriptionId "bf308a5c-0624-4334-8ff8-8dca9fd43783"}}
  {{- "ccd-shared-saat" -}}
  {{- else }}
  {{- "ccd-shared-aat" -}}
  {{- end }}
{{- end }}
{{- define "hmcts.ccdupi.releaseName" -}}
{{- if .Values.releaseNameOverride -}}
{{- tpl .Values.releaseNameOverride $ | trunc 53 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 53 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}