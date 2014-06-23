jQuery ($) ->
	$('.ballot').sortable().disableSelection()

	$('.ballotItem .moveTop').on 'click', (e) ->
		parents = $(this).parents()
		ballotItem=parents.filter '.ballotItem'
		ballot=parents.filter '.ballot'

		ballotItem.detach()
		ballot.prepend ballotItem

	$('.ballotItem .moveBottom').on 'click', (e) ->
		parents = $(this).parents()
		ballotItem=parents.filter '.ballotItem'
		ballot=parents.filter '.ballot'

		ballotItem.detach()
		ballot.append ballotItem

	$('.ballotItem .moveUp').on 'click', (e) ->
		parents = $(this).parents()
		ballotItem=parents.filter '.ballotItem'
		prev= ballotItem.prev()

		ballotItem.detach()
		prev.before ballotItem

	$('.ballotItem .moveDown').on 'click', (e) ->
		parents = $(this).parents()
		ballotItem=parents.filter '.ballotItem'
		next= ballotItem.next()

		ballotItem.detach()
		next.after ballotItem
