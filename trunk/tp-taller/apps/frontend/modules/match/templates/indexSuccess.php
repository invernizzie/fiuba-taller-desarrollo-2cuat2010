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

<h1>Matches List</h1>

<table class="matches">
  <thead>
    <tr>
      <th>Id</th>
      <th>Starting time</th>
      <th>Discipline</th>
      <th>Owner</th>
      <th>Rental</th>
      <th>Local</th>
      <th>Away</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($matchs as $i => $match): ?>
    <tr class="<?php echo fmod($i,2)? 'even' : 'odd'?>">
      <td><a href="<?php echo url_for('match/show?id='.$match->getId()) ?>"><?php echo $match->getId() ?></a></td>
      <td><?php echo $match->getStartingTime() ?></td>
      <td><?php echo $match->getDiscipline()->getName() ?></td>
      <td><?php echo $match->getOwnerId() ?></td>
      <td><?php echo $match->getCourt()->getName() ?></td>
      <td><?php echo $match->getLocalId() ?></td>
      <td><?php echo $match->getAwayId() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

<a href="<?php echo url_for('match/new') ?>">New</a>
