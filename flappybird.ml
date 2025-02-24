open Engine

(* L'oiseau Flappy *)
let flappy = "()\n           "

(* Dimension de Flappy *)
let flappy_width, _ = get_bounds flappy

(* Positions du plafond et du sol *)
let bas = 0.0
let haut = 30.0

(* Création d'une ligne de #*)
let line = String.make 9999 '#' 

(* Création du sol et du plafond *)
let sol = (0.0, bas), line
let plafond = (0.0, haut), line
let scoresolide = (0.0, 35.0), "score : 0"

(* Création d'une liste de solides contenant le décor et de l'emplacement du score  *)
let solides = [sol; plafond; scoresolide] 

(* Etat initial du jeu *)
let init_state = ((10.0, 15.0), (0.0, 0.0), ([], solides)) 

(* Translate la position de chaque solide par le vecteur donné *)
let translate_auxiliaire vecteur (pos, c) = (pos +.. vecteur, c) 
let rec translate vecteur solide =
  match solide with
  | [] -> []
  | a::b -> (translate_auxiliaire vecteur a) :: (translate vecteur b)

(*Fusionne deux listes*)
let rec fusion_tableaux liste1 liste2 = 
  match liste1 with
  | [] -> liste2
  | a::b -> a::(fusion_tableaux b liste2)

  (* Création de tuyaux de tailles aléatoires *)
let _ =  Random.self_init ()
let generate_obstacles y_pos is_haut =
  let nb_obstacles = 5 in  
  let rec generate_height curr_height res =
    if curr_height <= 0 then res
    else if curr_height = 1 && is_haut then (res ^ "|====|\n")
    else if curr_height = 1 then ("|====|\n" ^ res)
    else generate_height (curr_height - 1) (res ^ "|    |\n")
  in
  let rec generate_obstacles_helper acc count =
    if count <= 0 then acc
    else begin
      let height = Random.int 5 + 8 in
      let obstacle_y = if is_haut then haut -. (float_of_int height) else bas  in
      let obstacle =
        (Random.float width, obstacle_y), generate_height height ""
      in
      generate_obstacles_helper (obstacle :: acc) (count - 1)
    end
  in
  generate_obstacles_helper [] nb_obstacles

let obstacles_generated = ref false

(* Fonction update avec force du saut, vitesse de Flappy, sauter avec z, démarrer avec d *)
let update ((x, y), (vx, vy), (_, solide)) key = 
  let force_saut = 20.0 in
  let vitesse_flappy = 5.0 in
  let (vitesse, _) = 
    match key with
    | Some (key, shift, ctrl) ->
        (match key with
        | Char 'z' ->  
            ((vx, force_saut), [])
        | Char 'd' -> 
            let new_vx = if x +. vitesse_flappy > width -. flappy_width then 0.0 else vitesse_flappy in
            ((new_vx, vy), [])
        | _ -> ((vx, vy), []))
    | None -> ((vx, vy), [])
  in
  let updated_solide =
    if not !obstacles_generated && vy = 0.0 then (
      obstacles_generated := true;
      let obstacles_haut = generate_obstacles 1.0 true in
      let obstacles_bas = generate_obstacles 30.0 false in
      obstacles_haut @ obstacles_bas @ solide
    ) else solide
  in
  let (pos, vitesse, _) =
    update_physics ((x, y), flappy) vitesse [gravity] updated_solide
  in
  (pos, vitesse, ([], updated_solide)) 


(* Fonction d'affichage *)
let affiche ((x, y), _, (_, solide)) =
  let (pos, vitesse) =
      ((x, y), (0.0, 0.0))
  in
  ((pos, flappy) :: (translate vitesse solide))

let _ = loop init_state update affiche
