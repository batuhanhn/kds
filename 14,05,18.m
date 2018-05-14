# kds
<!DOCTYPE html>
<html>
<head>
<div>
<form class="form-signin" method="POST" action="index.php">
<select class="form-control selectpicker" name="il" id="il">
  <option value="34">İstanbul</option>
  <option value="35">İzmir</option>
  
</select>
<select class="form-control selectpicker" name="ilce" id="ilce">
  <option value="1">Buca</option>
  <option value="2">Kadıköy</option>
</select>
<select class="form-control selectpicker" name="ay" id="ay">
  <option value="1">Ocak</option>
  <option value="2">Şubat</option>
</select>
<button class="btn-primary" type="submit">Sorgu</button>
</form>
</div>

<div  id="myDiv" class="float-right mx-auto text-white-50 animate-bottom"  >


<table class="table table-hover table-bordered text-white bg-primary  ">
        <thead>
            <tr>
                <td>İl Adı</td>
                <td>İlçe Adı</td>
				<td>Ay</td>
				<td>Toprak Çeşidi</td>
				<td>Yağış Miktarı</td>
				<td>Sıcaklık</td>
				
            </tr>
        </thead>
        <tbody>
        <?php
		$il=$_POST["il"];
		$ilce=$_POST["ilce"];
		$ay=$_POST["ay"];
			$sorgu="SELECT il.il_ad, ilce.ilce_ad, aylar.ay_ad,topraklar.toprak_ad,yagislar.miktar,sicaklik.derece
FROM il, il_ilce, ilce, aylar, topraklar, yagislar, sicaklik
WHERE il.il_id=il_ilce.il_id AND il_ilce.ilce_id=ilce.ilce_id AND topraklar.ilce_id=ilce.ilce_id AND yagislar.ilce_id=ilce.ilce_id AND aylar.ay_id=yagislar.ay_id AND aylar.ay_id=sicaklik.ay_id AND sicaklik.ilce_id=ilce.ilce_id AND il.il_id=$il AND ilce.ilce_id=$ilce AND aylar.ay_id=$ay";
            $connect=mysqli_connect("localhost","root","","kds2001");
			mysqli_query($connect,"SET CHARACTER SET 'utf8'");
			mysqli_query($connect,"SET SESSION collation_connection ='utf8_unicode_ci'");
			
            if (!$connect) {
                die(mysqli_error());
            }
            
            $results = mysqli_query($connect,$sorgu);
            while($row = mysqli_fetch_array($results)) {
            ?>
                <tr>
                    <td><?php echo $row['il_ad']?></td>
                    <td><?php echo $row['ilce_ad']?></td>
					<td><?php echo $row['ay_ad']?></td>
					<td><?php echo $row['toprak_ad']?></td>
					<td><?php echo $row['miktar']?></td>
					<td><?php echo $row['derece']?></td>
                </tr>

            <?php
            }
            ?>
            </tbody>
            </table>
	  
	  
    </div>
</div>
</body>
</html>
