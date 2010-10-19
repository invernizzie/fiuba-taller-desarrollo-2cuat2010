<?php if ($sf_user->isFacebookConnected()): ?>

<fb:serverfbml style="width: 740px;">
	<script type="text/fbml">
        <fb:fbml>
        	<fb:request-form target="_top" action="[where to redirect after invite]" method="post" type="[name of your app]" content="[text the user will receive]&lt;fb:req-choice url=&quot;http://apps.facebook.com/[your app]/&quot; label=&quot;Accept!&quot;  " image="" invite="true">
        		<fb:multi-friend-selector cols="4" actiontext="[some text above the invite form]" />
	        </fb:request-form>
        </fb:fbml>
    </script>
</fb:serverfbml>

<?php else: ?>
<p>Ooops?</p>
<br />
<?php endif; ?>

<h1>Matchs List</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Starting time</th>
      <th>Closed</th>
      <th>Played</th>
      <th>Public</th>
      <th>Discipline</th>
      <th>Owner</th>
      <th>Rental</th>
      <th>Local</th>
      <th>Away</th>
      <th>Created at</th>
      <th>Updated at</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($matchs as $match): ?>
    <tr>
      <td><a href="<?php echo url_for('match/show?id='.$match->getId()) ?>"><?php echo $match->getId() ?></a></td>
      <td><?php echo $match->getStartingTime() ?></td>
      <td><?php echo $match->getClosed() ?></td>
      <td><?php echo $match->getPlayed() ?></td>
      <td><?php echo $match->getPublic() ?></td>
      <td><?php echo $match->getDisciplineId() ?></td>
      <td><?php echo $match->getOwnerId() ?></td>
      <td><?php echo $match->getRentalId() ?></td>
      <td><?php echo $match->getLocalId() ?></td>
      <td><?php echo $match->getAwayId() ?></td>
      <td><?php echo $match->getCreatedAt() ?></td>
      <td><?php echo $match->getUpdatedAt() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

  <a href="<?php echo url_for('match/new') ?>">New</a>
