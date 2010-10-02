<table>
  <tbody>
    <tr>
      <th>Id:</th>
      <td><?php echo $match->getId() ?></td>
    </tr>
    <tr>
      <th>Starting time:</th>
      <td><?php echo $match->getStartingTime() ?></td>
    </tr>
    <tr>
      <th>Closed:</th>
      <td><?php echo $match->getClosed() ?></td>
    </tr>
    <tr>
      <th>Played:</th>
      <td><?php echo $match->getPlayed() ?></td>
    </tr>
    <tr>
      <th>Public:</th>
      <td><?php echo $match->getPublic() ?></td>
    </tr>
    <tr>
      <th>Discipline:</th>
      <td><?php echo $match->getDisciplineId() ?></td>
    </tr>
    <tr>
      <th>Owner:</th>
      <td><?php echo $match->getOwnerId() ?></td>
    </tr>
    <tr>
      <th>Rental:</th>
      <td><?php echo $match->getRentalId() ?></td>
    </tr>
    <tr>
      <th>Local:</th>
      <td><?php echo $match->getLocalId() ?></td>
    </tr>
    <tr>
      <th>Away:</th>
      <td><?php echo $match->getAwayId() ?></td>
    </tr>
    <tr>
      <th>Created at:</th>
      <td><?php echo $match->getCreatedAt() ?></td>
    </tr>
    <tr>
      <th>Updated at:</th>
      <td><?php echo $match->getUpdatedAt() ?></td>
    </tr>
  </tbody>
</table>

<hr />

<a href="<?php echo url_for('match/edit?id='.$match->getId()) ?>">Edit</a>
&nbsp;
<a href="<?php echo url_for('match/index') ?>">List</a>
