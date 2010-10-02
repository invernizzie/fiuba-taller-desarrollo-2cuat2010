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
