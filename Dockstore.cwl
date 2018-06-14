baseCommand: []
class: CommandLineTool
cwlVersion: v1.0
id: vcfeval-happy-comparison
inputs:
  query_vcf:
    doc: The GRCh37-based VCF (ideally compressed with bgzip) with the query (test
      set) variants
    inputBinding:
      position: 1
      prefix: --query_vcf
    type: File
  truth_bed:
    doc: A BED file with the GRCh37 coordinates corresponding to confident regions
      of the truth VCF
    inputBinding:
      position: 3
      prefix: --truth_bed
    type: File
  truth_vcf:
    doc: The GRCh37-based VCF (ideally compressed with bgzip) with the truth (benchmark
      set) variants
    inputBinding:
      position: 2
      prefix: --truth_vcf
    type: File
label: Vcfeval + Hap.py Comparison
outputs:
  archived_results:
    doc: An archive containing all the results as output by the comparator
    outputBinding:
      glob: archived_results/*
    type: File
  extended_csv:
    doc: A CSV file with extended statistics as output by the comparator
    outputBinding:
      glob: extended_csv/*
    type: File
requirements:
- class: DockerRequirement
  dockerOutputDirectory: /data/out
  dockerPull: pfda2dockstore/vcfeval-happy-comparison:3
s:author:
  class: s:Person
  s:name: George Asimenos
