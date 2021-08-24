id=$( xinput | grep 'Tablet Pen Pen' | sed s/.*id=// | sed 's/\s.*//')


xinput map-to-output $id $1
