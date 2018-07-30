require 'asciidoctor/html5s/version'
require 'asciidoctor/extensions' unless RUBY_PLATFORM == 'opal'

module Asciidoctor::Html5s

  # This extension moves every callout list immediately following listing block
  # to instance variable +@html5s_colist+ inside the listing block.
  # The aim is to render callout list as part of the corresponding listing.
  class AttachedColistTreeprocessor < ::Asciidoctor::Extensions::Treeprocessor

    def process(document)
      # XXX: We have to defer deletion of the original colist nodes after
      # the #find_by iteration is done to make it work under Opal.
      # See <https://github.com/jirutka/asciidoctor-html5s/issues/7>.
      document.find_by(context: :colist).reduce([]) { |memo, colist|
        blocks = colist.parent.blocks
        colist_idx = blocks.find_index(colist)
        prev_block = blocks[colist_idx - 1] if colist_idx

        if prev_block && prev_block.node_name == 'listing'
          prev_block.instance_variable_set(:@html5s_colist, colist)
          memo << ->() { blocks.delete_at(colist_idx) }  # mutates node's blocks list!
        end
        memo
      }.each(&:call)
    end
  end
end
