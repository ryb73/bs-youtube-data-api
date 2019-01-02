type snippet = {
    channelId: string,
    channelTitle: string,
    title: string,
    description: string,
    playlistId: string,
    position: int,
};

type id = string;

type contentDetails = {
    videoId: string,
    note: option(string),
};

type item('cd, 's) = {
    id: id,
    contentDetails: 'cd,
    snippet: 's,
};

module List: {
    type result('cd, 's) = { items: array(item('cd, 's)), };
    let maxResultsLimit: int;
};

type parts('cd, 's);
let parts: parts(unit, unit);
let withContentDetails: parts('a, 'b) => parts(contentDetails, 'b);
let withSnippet: parts('a, 'b) => parts('a, snippet);

let listByPlaylistId:
    (~maxResults: int=?, ~parts: parts('a, 'b), ~playlistId: string,
    string) => Reduice.Promise.t(List.result('a, 'b));